defmodule CTrader.OpenAPI.Application do
  @moduledoc false

  use Application

  alias CTrader.OpenApi.AuthorizationCodeTask

  @impl true
  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: AuthorizationCodeTask.supervisor()}
    ]

    opts = [strategy: :one_for_one, name: CTrader.OpenApi.AuthorizationCodeTask]
    Supervisor.start_link(children, opts)
  end
end
