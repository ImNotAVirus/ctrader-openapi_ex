defmodule CTrader.OpenApi.ApplicationTokens do
  @moduledoc """
  Structure containing the access and refresh tokens.
  """

  alias __MODULE__

  @enforce_keys [:access_token, :refresh_token, :expiration]
  defstruct @enforce_keys

  ## Public API

  def cast(attrs, now \\ DateTime.utc_now()) do
    case attrs do
      %{
        "tokenType" => "bearer",
        "access_token" => access_token,
        "refresh_token" => refresh_token,
        "expires_in" => expires_in
      } ->
        struct =
          %ApplicationTokens{
            access_token: access_token,
            refresh_token: refresh_token,
            expiration: DateTime.add(now, expires_in, :second)
          }

        {:ok, struct}

      _ ->
        {:error, :invalid_token}
    end
  end
end
