defmodule CTrader.OpenApi.Protobuf.Messages.ProtoPayloadType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :PROTO_MESSAGE, 5
  field :ERROR_RES, 50
  field :HEARTBEAT_EVENT, 51
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoErrorCode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :UNKNOWN_ERROR, 1
  field :UNSUPPORTED_MESSAGE, 2
  field :INVALID_REQUEST, 3
  field :TIMEOUT_ERROR, 5
  field :ENTITY_NOT_FOUND, 6
  field :CANT_ROUTE_REQUEST, 7
  field :FRAME_TOO_LONG, 8
  field :MARKET_CLOSED, 9
  field :CONCURRENT_MODIFICATION, 10
  field :BLOCKED_PAYLOAD_TYPE, 11
end
