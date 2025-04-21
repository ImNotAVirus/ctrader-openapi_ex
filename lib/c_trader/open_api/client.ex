defmodule CTrader.OpenApi.Client do
  @moduledoc """
  Manage a CTrader connection.
  """

  alias CTrader.OpenApi.Client.Endpoint
  alias CTrader.OpenApi.Protobuf.Messages, as: Msg

  @type error_res :: {error_code :: String.t(), description :: String.t()}

  ## Public API

  defdelegate child_spec(args), to: CTrader.OpenApi.Client.Endpoint
  defdelegate start_link(args), to: CTrader.OpenApi.Client.Endpoint
  defdelegate subscribe(endpoint, account_id), to: CTrader.OpenApi.Client.Endpoint
  defdelegate unsubscribe(endpoint, account_id), to: CTrader.OpenApi.Client.Endpoint

  @doc """
  Request for authorizing of the trading account session.

  Examples:

      iex> Client.authenticate(pid, 40180994, "1sCi1dtrlh_rrx_1BBM8bPe67pylNuGF3zV2aHW7hb4")
      iex> Client.authenticate(pid, 40180994, "1sCi1dtrlh_rrx_1BBM8bPe67pylNuGF3zV2aHW7hb4", subscribe: true)

  """
  @spec authenticate(GenServer.server(), pos_integer(), String.t(), Keyword.t()) ::
          {:ok, {}} | {:error, error_res()}
  def authenticate(client, account_id, access_token, opts \\ []) do
    subscribe? = Keyword.get(opts, :subscribe, false)

    payload = %Msg.ProtoOAAccountAuthReq{
      ctidTraderAccountId: account_id,
      accessToken: access_token
    }

    case Endpoint.call(client, payload) do
      %Msg.ProtoOAAccountAuthRes{} ->
        if subscribe? do
          Endpoint.subscribe(client, account_id)
        end

        {:ok, {}}

      %Msg.ProtoOAErrorRes{} = error ->
        {:error, struct_to_error(error)}
    end
  end

  @doc """
  Request for getting data of Trader's Account.

  Examples:

      iex> CTrader.Client.get_trader_info(:demo, 40189994)

  """
  @spec get_trader_info(GenServer.server(), pos_integer()) ::
          {:ok, Msg.ProtoOATrader.t()} | {:error, error_res()}
  def get_trader_info(client, account_id) do
    payload = %Msg.ProtoOATraderReq{ctidTraderAccountId: account_id}

    call(client, payload, Msg.ProtoOATraderRes, :trader)
  end

  @doc """
  Request for getting a full symbol entity.
  """
  @spec get_symbol(GenServer.server(), pos_integer(), pos_integer()) ::
          {:ok, Msg.ProtoOASymbol.t()} | {:error, error_res()}
  def get_symbol(client, account_id, symbol_id) do
    payload = %Msg.ProtoOASymbolByIdReq{
      ctidTraderAccountId: account_id,
      symbolId: [symbol_id]
    }

    with {:ok, [symbol]} <- call(client, payload, Msg.ProtoOASymbolByIdRes, :symbol) do
      {:ok, symbol}
    end
  end

  @doc """
  Request for getting historical trend bars for the symbol.
  """
  @spec get_trendbars(
          GenServer.server(),
          pos_integer(),
          pos_integer(),
          Msg.ProtoOATrendbarPeriod.t(),
          Keyword.t()
        ) :: {:ok, [Msg.ProtoOATrendbar.t()]} | {:error, error_res()}
  def get_trendbars(client, account_id, symbol_id, timeframe, opts \\ []) do
    from = opts |> Keyword.get(:from) |> time_to_ms()
    to = opts |> Keyword.get(:from) |> time_to_ms()
    count = Keyword.get(opts, :count)
    timeout = Keyword.get(opts, :timeout)

    payload = %Msg.ProtoOAGetTrendbarsReq{
      ctidTraderAccountId: account_id,
      fromTimestamp: from,
      toTimestamp: to,
      period: timeframe,
      symbolId: symbol_id,
      count: count
    }

    call(client, payload, Msg.ProtoOAGetTrendbarsRes, :trendbar, timeout)
  end

  @doc """
  Request for getting the list of granted trader's account for the access token.

  Also check:

    - https://api.spotware.com/connect/tradingaccounts?access_token=1sCi1dtrlh_rrx_1BAM8bPe67pylNuGF3zV2aHW7hb4

  Examples:

      iex> Client.list_accounts(pid, "1sCi1dtrlh_rrx_1BAM8bPe67pylNuGF3zV2aHW7hb4")

  """
  @spec list_accounts(GenServer.server(), String.t()) ::
          {:ok, [Msg.ProtoOACtidTraderAccount.t()]} | {:error, error_res()}
  def list_accounts(client, access_token) do
    payload = %Msg.ProtoOAGetAccountListByAccessTokenReq{accessToken: access_token}

    call(client, payload, Msg.ProtoOAGetAccountListByAccessTokenRes, :ctidTraderAccount)
  end

  @doc """
  Request for the list of assets available for a trader's account.
  """
  @spec list_assets(GenServer.server(), pos_integer()) ::
          {:ok, [Msg.ProtoOAAsset.t()]} | {:error, error_res()}
  def list_assets(client, account_id) do
    payload = %Msg.ProtoOAAssetListReq{ctidTraderAccountId: account_id}

    call(client, payload, Msg.ProtoOAAssetListRes, :asset)
  end

  @doc """
  Request for a list of asset classes available for the trader's account.
  """
  @spec list_asset_classes(GenServer.server(), pos_integer()) ::
          {:ok, [Msg.ProtoOAAssetClass.t()]} | {:error, error_res()}
  def list_asset_classes(client, account_id) do
    payload = %Msg.ProtoOAAssetClassListReq{ctidTraderAccountId: account_id}

    call(client, payload, Msg.ProtoOAAssetClassListRes, :assetClass)
  end

  @doc """
  Request for a list of symbols available for a trading account.

  Symbol entries are returned with the limited set of fields.
  """
  @spec list_symbols(GenServer.server(), pos_integer()) ::
          {:ok, [Msg.ProtoOALightSymbol.t()]} | {:error, error_res()}
  def list_symbols(client, account_id) do
    payload = %Msg.ProtoOASymbolsListReq{
      ctidTraderAccountId: account_id,
      includeArchivedSymbols: false
    }

    call(client, payload, Msg.ProtoOASymbolsListRes, :symbol)
  end

  ## Private functions

  defp call(client, payload, struct, field, timeout \\ nil) do
    result =
      case timeout do
        nil -> Endpoint.call(client, payload)
        _ -> Endpoint.call(client, payload, timeout)
      end

    case result do
      %^struct{} = result -> {:ok, Map.fetch!(result, field)}
      %Msg.ProtoOAErrorRes{} = error -> {:error, struct_to_error(error)}
    end
  end

  defp struct_to_error(%Msg.ProtoOAErrorRes{errorCode: code, description: description}) do
    {code, description}
  end

  defp time_to_ms(time) do
    case time do
      %DateTime{} = time ->
        DateTime.to_unix(time, :millisecond)

      %NaiveDateTime{} = time ->
        time |> DateTime.from_naive!("Etc/UTC") |> DateTime.to_unix(:millisecond)

      value ->
        value
    end
  end
end
