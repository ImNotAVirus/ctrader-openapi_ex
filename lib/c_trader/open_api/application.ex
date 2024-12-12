defmodule CTrader.OpenAPI.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: CTrader.OpenAPI.TaskSupervisor}
    ]

    opts = [strategy: :one_for_one, name: CTrader.OpenApi.AuthorizationCodeTask]
    Supervisor.start_link(children, opts)
  end
end
