defmodule CTrader.OpenApi.AuthorizationCodeTask do
  @moduledoc """
  Start a simple HTTP server to receive an authorization code.
  """

  use Task

  require Logger

  @default_timeout :timer.minutes(1)

  ## Public API

  def once(opts \\ []) do
    timeout = Keyword.get(opts, :timeout, @default_timeout)

    __MODULE__
    |> Task.async(:run, [opts])
    |> Task.await(timeout)
  catch
    :exit, {:timeout, {Task, :await, _task}} ->
      {:error, :timeout}
  end

  ## Task callback

  def run(opts) do
    ip = Keyword.get(opts, :ip, "127.0.0.1")
    port = Keyword.get(opts, :port, 6969)
    path = Keyword.get(opts, :path, "/code/")
    timeout = Keyword.get(opts, :timeout, @default_timeout)

    {:ok, ip_tuple} = ip |> String.to_charlist() |> :inet.parse_address()

    {:ok, socket} = :gen_tcp.listen(port, [:binary, ip: ip_tuple, reuseaddr: true])
    Logger.debug("AuthorizationCodeServer started on #{ip}:#{port}")

    {:ok, client} = :gen_tcp.accept(socket)
    Logger.debug("Client connected")

    receive do
      {:tcp, ^client, data} ->
        data
        |> parse_data(path)
        |> tap(&send_response(client, &1))

      {event, ^client} when event in [:tcp_closed, :tcp_error] ->
        {:error, event}
    after
      timeout -> {:error, :timeout}
    end
  end

  ## Private functions

  defp parse_data(data, path) do
    # GET /code/?code=dd571a4b990cb0aba1f4f037835b56d553e77da091f727bba0be919ea05d9bddb3ebba5aa36a804d871445 HTTP/1.1
    re = Regex.compile!("^GET #{path}\\?code=([0-9a-f]+) HTTP/1\.1\r\n")

    case Regex.run(re, data, capture: :all_but_first) do
      [code] -> {:ok, code}
      _ -> {:error, :invalid_query}
    end
  end

  defp send_response(client, reply) do
    # :ok = :gen_tcp.send(socket, data)
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
