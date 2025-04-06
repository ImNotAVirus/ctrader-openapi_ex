defmodule CTrader.OpenApi.AuthorizationCodeTask do
  @moduledoc """
  Start a simple HTTP server to receive an authorization code.
  """

  use Task

  require Logger

  @default_ip "127.0.0.1"
  @default_port 6969
  @default_path "/code/"
  @default_timeout :timer.minutes(1)

  ## Public API

  @doc false
  def supervisor(), do: CTrader.OpenAPI.TaskSupervisor

  def start(opts \\ []), do: do_start(:no_link, opts)
  def start_link(opts \\ []), do: do_start(:link, opts)

  def await(%Task{} = task) do
    Task.await(task, :infinity)
  end

  def once(opts \\ []) do
    __MODULE__
    |> Task.async(:run, [opts])
    |> Task.await(:infinity)
  end

  ## Task callback

  def run(opts) do
    start_time = now()

    ip = Keyword.get(opts, :ip, @default_ip)
    port = Keyword.get(opts, :port, @default_port)
    path = Keyword.get(opts, :path, @default_path)
    timeout = Keyword.get(opts, :timeout, @default_timeout)

    {:ok, ip_tuple} = ip |> String.to_charlist() |> :inet.parse_address()

    {:ok, socket} = :gen_tcp.listen(port, [:binary, ip: ip_tuple, reuseaddr: true])
    Logger.debug("AuthorizationCodeServer started on #{ip}:#{port} (#{path})")

    with {:ok, client} <- :gen_tcp.accept(socket, timeout) do
      Logger.debug("Client connected")

      remaining_timeout = max(start_time + timeout - now(), 0)

      receive do
        {:tcp, ^client, data} ->
          data
          |> parse_data(path)
          |> tap(&send_response(client, &1))

        {event, ^client} when event in [:tcp_closed, :tcp_error] ->
          {:error, event}
      after
        remaining_timeout -> {:error, :timeout}
      end
    end
  end

  ## Private functions

  defp now(), do: System.monotonic_time(:millisecond)

  defp random_uid() do
    6 |> :crypto.strong_rand_bytes() |> Base.encode32(case: :lower, padding: false)
  end

  defp do_start(link_type, opts) do
    uid = random_uid()
    opts = Keyword.put(opts, :uid, uid)

    link_fun =
      case link_type do
        :link -> :async
        :no_link -> :async_nolink
      end

    {:ok, apply(Task.Supervisor, link_fun, [supervisor(), __MODULE__, :run, [opts]])}
  end

  defp parse_data(data, path) do
    # GET /code/?code=dd571a4b990cb0aba1f4f037835b56d553e77da091f727bba0be919ea05d9bddb3ebba5aa36a804d871445 HTTP/1.1
    re = Regex.compile!("^GET #{path}\\?code=([0-9a-f]+) HTTP/1\.1\r\n")

    case Regex.run(re, data, capture: :all_but_first) do
      [code] -> {:ok, code}
      _ -> {:error, :invalid_query}
    end
  end

  defp send_response(client, reply) do
    render =
      case reply do
        {:ok, code} -> html_render(false, code)
        {:error, reason} -> html_render(true, reason)
      end

    response =
      """
      HTTP/1.1 200 OK
      Content-Length: #{String.length(render)}
      Content-Type: text/html; charset=utf-8

      """
      |> String.trim_leading()
      |> String.replace("\n", "\r\n")
      |> Kernel.<>(render)

    :ok = :gen_tcp.send(client, response)
  end

  defp html_render(is_error, value) do
    {background, border} =
      case is_error do
        false -> {"#588157", "#344e41"}
        true -> {"#815757", "#4e3434"}
      end

    """
    <!DOCTYPE html>
    <html lang="en" style="background-color: #{background};">
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Authorization Code</title>
        <style>
          html, body, .container {
            height: 100%;
          }

          .container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
          }
      </style>
      </head>

      <body>
        <div class="container"> 
          <div id="value" style="border: #{border} 3px solid;padding: 1rem;min-width: 10rem;text-align: center;">
            #{value}
          </div>
          <div style="margin-top: 0.5rem;">You can close the window</div>
        </div>  
      </body>
    </html>
    """
  end
end
