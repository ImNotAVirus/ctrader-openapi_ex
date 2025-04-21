defmodule CTrader.OpenApi.Protobuf.Messages.ProtoMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1, required: true, type: :uint32
  field :payload, 2, optional: true, type: :bytes
  field :clientMsgId, 3, optional: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoErrorRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoPayloadType,
    default: :ERROR_RES,
    enum: true

  field :errorCode, 2, required: true, type: :string
  field :description, 3, optional: true, type: :string
  field :maintenanceEndTimestamp, 4, optional: true, type: :uint64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoHeartbeatEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoPayloadType,
    default: :HEARTBEAT_EVENT,
    enum: true
end
