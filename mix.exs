defmodule CTrader.OpenAPI.MixProject do
  use Mix.Project

  def project() do
    [
      app: :ctrader_open_api,
      version: "0.1.0",
      elixir: "~> 1.18.0",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application() do
    [
      extra_applications: [:logger, :inets, :ssl],
      mod: {CTrader.OpenAPI.Application, []}
    ]
  end

  defp aliases() do
    [
      "proto.compile": &compile_proto/1,
    ]
  end


  # Run "mix help deps" to learn about dependencies.
  defp deps() do
    [
      {:protobuf, "~> 0.14"}
    ]
  end

  # mix escript.install hex protobuf
  defp compile_proto(_args) do
    path = Path.absname("priv/openapi-proto-messages")
    out_path = Path.absname("lib/c_trader/open_api/protobuf/messages")
    files = Path.wildcard("#{path}/*.proto") |> Enum.map(&Path.relative_to(&1, path))

    :ok = File.mkdir_p!(out_path)

    opts = [cd: path, stderr_to_stdout: true]

    args = [
      "--elixir_out=#{out_path}",
      "--elixir_opt=package_prefix=c_trader.open_api.protobuf.messages" | files
    ]

    {out, status} = System.cmd("protoc", args, opts)

    IO.write(out)
    IO.puts("Done.")
    System.halt(status)
  end
end
