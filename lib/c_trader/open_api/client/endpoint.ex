defmodule CTrader.OpenApi.Client.Endpoint do
  @moduledoc false

  ## TODO: forwarding via account_map (subscribe)
  ## TODO: messages rate limiting

  use GenServer

  require Logger

  alias __MODULE__
  alias CTrader.OpenApi.Endpoints
  alias CTrader.OpenApi.Protobuf.Messages, as: Msg
  alias CTrader.OpenApi.Protobuf.ProtobufBinary

  # req = %{id => reply_from}
  # accounts_map = %{account_id => pid}
  # mon_refs = %{ref => account_id}
  @enforce_keys [:endpoint, :client_id, :secret]
  defstruct @enforce_keys ++
              [
                :socket,
                reqs: %{},
                accounts_map: %{},
                mon_refs: %{},
                heartbeat_interval: :timer.seconds(10)
              ]

  @type endpoint :: {host :: String.t(), port: 1..65_535}

  @timeout :timer.seconds(5)

  ## Public API

  @doc false
  def child_spec(args) do
    %{
      id: {__MODULE__, Keyword.fetch!(args, :endpoint)},
      start: {__MODULE__, :start_link, [args]},
      restart: :permanent
    }
  end

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, args)
  end

  def call(endpoint, payload, timeout \\ 5000) do
    GenServer.call(endpoint, {:call, payload}, timeout)
  end

  def cast(endpoint, payload) do
    GenServer.cast(endpoint, {:cast, payload})
  end

  def subscribe(endpoint, account_id) do
    GenServer.call(endpoint, {:subscribe, account_id})
  end

  def unsubscribe(endpoint, account_id) do
    GenServer.call(endpoint, {:unsubscribe, account_id})
  end

  ## GenServer behaviour

  @impl true
  def init(args) do
    endpoint = Keyword.fetch!(args, :endpoint)
    client_id = Keyword.fetch!(args, :client_id)
    secret = Keyword.fetch!(args, :secret)

    endpoint =
      case endpoint do
        :live -> {Endpoints.live_host(), Endpoints.protobuf_port()}
        :demo -> {Endpoints.demo_host(), Endpoints.protobuf_port()}
        {_host, _port} -> endpoint
      end

    state = %Endpoint{endpoint: endpoint, client_id: client_id, secret: secret}
    {:ok, state, {:continue, :connect}}
  end

  @impl true
  def handle_continue(:connect, %Endpoint{} = state) do
    %Endpoint{endpoint: endpoint, client_id: client_id, secret: secret} = state

    # First connect to CTrader endpoint
    {host, port} = endpoint
    {:ok, socket} = connect(host, port)
    Logger.info("Connected to #{host}:#{port}")

    # Then authenticate the application
    :ok = authenticate_application(socket, client_id, secret)

    # Set opts to active
    :ok = :ssl.setopts(socket, active: true)

    # Send Heartbeat every 10 secs
    _ref = schedule_heartbeat(state.heartbeat_interval)

    {:noreply, %Endpoint{state | socket: socket}}
  end

  @impl true
  def handle_call({:subscribe, account_id}, {from_pid, _from_ref}, state) do
    %Endpoint{accounts_map: accounts_map, mon_refs: mon_refs} = state

    case accounts_map do
      %{^account_id => ^from_pid} ->
        {:reply, :ok, state}

      %{^account_id => pid} ->
        Logger.warning("account #{account_id} is already linked to #{inspect(pid)}")
        {:reply, {:error, :already_linked}, state}

      _ ->
        new_accounts_map = Map.put(accounts_map, account_id, from_pid)
        mon_ref = Process.monitor(from_pid)
        new_mon_refs = Map.put(mon_refs, mon_ref, account_id)

        {:reply, :ok, %Endpoint{state | accounts_map: new_accounts_map, mon_refs: new_mon_refs}}
    end
  end

  @impl true
  def handle_call({:unsubscribe, account_id}, {from_pid, _from_ref}, state) do
    %Endpoint{accounts_map: accounts_map, mon_refs: mon_refs} = state
    maybe_ref = Enum.find_value(mon_refs, fn {ref, id} -> if id == account_id, do: ref end)

    with {^account_id, new_mon_refs} <- Map.pop(mon_refs, maybe_ref),
         {^from_pid, new_accounts_map} <- Map.pop(accounts_map, account_id) do
      _ = Process.demonitor(maybe_ref, [:flush])
      {:reply, :ok, %Endpoint{state | accounts_map: new_accounts_map, mon_refs: new_mon_refs}}
    else
      _ ->
        {:reply, {:error, :unable_to_unsubscribe}, state}
    end
  end

  @impl true
  def handle_call({:call, payload}, from, %Endpoint{} = state) do
    id = new_id()
    :ok = send_message(state.socket, payload, client_msg_id: id)

    {:noreply, %Endpoint{state | reqs: Map.put(state.reqs, id, from)}}
  end

  @impl true
  def handle_cast({:cast, payload}, %Endpoint{} = state) do
    :ok = send_message(state.socket, payload)
    {:noreply, state}
  end

  @impl true
  def handle_info({:ssl, _socket, data}, %Endpoint{} = state) do
    %Endpoint{reqs: reqs, accounts_map: accounts_map} = state

    %Msg.ProtoMessage{
      clientMsgId: msg_id,
      payload: payload
    } = message = ProtobufBinary.decode(data)

    Logger.debug("Received #{inspect(message)}")

    _ = maybe_forward_message(payload, accounts_map)

    case msg_id do
      nil ->
        {:noreply, state}

      _ ->
        {from, new_reqs} = Map.pop(reqs, msg_id)

        if not is_nil(from) do
          :ok = GenServer.reply(from, payload)
        end

        {:noreply, %Endpoint{state | reqs: new_reqs}}
    end
  end

  @impl true
  def handle_info(:heartbeat, %Endpoint{} = state) do
    :ok = send_message(state.socket, %Msg.ProtoHeartbeatEvent{})

    # Reschedule Heartbeat
    _ref = schedule_heartbeat(state.heartbeat_interval)

    {:noreply, state}
  end

  @impl true
  def handle_info({:ssl_closed, _socket}, state) do
    Logger.info("ssl_closed")
    {:stop, :normal, state}
  end

  @impl true
  def handle_info({:ssl_error, _socket, reason}, state) do
    Logger.info("ssl_error #{inspect(reason)}")
    {:stop, :normal, state}
  end

  @impl true
  def handle_info({:DOWN, ref, :process, pid, reason}, state) do
    %Endpoint{accounts_map: accounts_map, mon_refs: mon_refs} = state

    {account_id, new_mon_refs} = Map.pop!(mon_refs, ref)
    {^pid, new_accounts_map} = Map.pop!(accounts_map, account_id)

    Logger.warning("process for account #{account_id} down with reason #{inspect(reason)}")

    {:noreply, %Endpoint{state | accounts_map: new_accounts_map, mon_refs: new_mon_refs}}
  end

  ## Private funtions

  defp new_id() do
    :crypto.strong_rand_bytes(15) |> Base.encode64(padding: false)
  end

  defp connect(host, port) do
    host_charlist = String.to_charlist(host)

    :ssl.connect(host_charlist, port, [
      :binary,
      packet: 4,
      active: false,
      verify: :verify_peer,
      cacerts: :public_key.cacerts_get(),
      customize_hostname_check: [
        match_fun: :public_key.pkix_verify_hostname_match_fun(:https)
      ]
    ])
  end

  defp authenticate_application(socket, client_id, secret) do
    struct = %Msg.ProtoOAApplicationAuthReq{clientId: client_id, clientSecret: secret}
    :ok = send_message(socket, struct)

    case receive_payload(socket) do
      {:ok, %Msg.ProtoOAApplicationAuthRes{}} ->
        :ok = Logger.info("Authentication succeed")

      {:ok, %Msg.ProtoOAErrorRes{description: description} = error} ->
        Logger.info("Authentication failed: #{description}")
        {:error, error}

      {:error, error} ->
        Logger.info("Authentication failed: #{inspect(error)}")
        {:error, error}
    end
  end

  defp send_message(socket, struct, opts \\ []) do
    case :ssl.send(socket, ProtobufBinary.encode(struct, opts)) do
      :ok ->
        :ok

      {:error, reason} ->
        Logger.error("""
        Failed to send message (#{inspect(reason)})

            #{inspect(struct)}"
        """)

        {:error, reason}
    end
  end

  defp receive_payload(socket) do
    with {:ok, data} <- :ssl.recv(socket, 0, @timeout) do
      {:ok, ProtobufBinary.decode_payload(data)}
    else
      {:error, reason} ->
        Logger.error("Failed to receive message (#{inspect(reason)})")
        {:error, reason}
    end
  end

  defp schedule_heartbeat(interval) do
    _ = Process.send_after(self(), :heartbeat, interval)
  end

  defp maybe_forward_message(payload, accounts_map) do
    with %_struct{ctidTraderAccountId: account_id} when not is_nil(account_id) <- payload,
         %{^account_id => account_pid} <- accounts_map do
      send(account_pid, {:event_received, payload})
    end
  end
end
