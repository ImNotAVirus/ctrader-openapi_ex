defmodule CTrader.OpenApi.Endpoints do
  @moduledoc """
  CTrader endpoints helpers.
  """

  alias CTrader.OpenApi.ApplicationTokens

  ## Types

  @type scope :: :accounts | :trading

  ## Public API

  def auth_uri(), do: "https://openapi.ctrader.com/apps/auth"
  def token_uri(), do: "https://openapi.ctrader.com/apps/token"
  def demo_host(), do: "demo.ctraderapi.com"
  def live_host(), do: "live.ctraderapi.com"
  def protobuf_port(), do: 5035
  # def json_port(), do: 5036

  @doc """
  Build an URL ro receive an authorization code for a specific cTID.
  """
  @spec build_auth_code_url(String.t(), String.t(), scope()) :: String.t()
  def build_auth_code_url(client_id, redirect_uri, scope) when scope in [:accounts, :trading] do
    base_url = "https://id.ctrader.com/my/settings/openapi/grantingaccess/"

    query = %{
      client_id: client_id,
      redirect_uri: redirect_uri,
      scope: scope,
      product: "web"
    }

    "#{base_url}?#{URI.encode_query(query)}"
  end

  def get_access_token(client_id, client_secret, auth_code, redirect_uri) do
    query = %{
      grant_type: "authorization_code",
      code: auth_code,
      redirect_uri: redirect_uri,
      client_id: client_id,
      client_secret: client_secret
    }

    url = "#{token_uri()}?#{URI.encode_query(query)}"
    headers = [{~c"Accept", ~c"application/json"}]
    http_request_opts = []

    case :httpc.request(:get, {url, headers}, http_request_opts, []) do
      {:ok, {{_, 200, _}, _headers, body}} ->
        body
        |> List.to_string()
        |> JSON.decode!()
        |> ApplicationTokens.cast()

      error ->
        {:error, error}
    end
  end
end
