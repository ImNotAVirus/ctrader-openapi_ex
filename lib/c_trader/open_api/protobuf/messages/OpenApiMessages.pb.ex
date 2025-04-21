defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAApplicationAuthReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_APPLICATION_AUTH_REQ,
    enum: true

  field :clientId, 2, required: true, type: :string
  field :clientSecret, 3, required: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAApplicationAuthRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_APPLICATION_AUTH_RES,
    enum: true
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAccountAuthReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ACCOUNT_AUTH_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :accessToken, 3, required: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAccountAuthRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ACCOUNT_AUTH_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAErrorRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ERROR_RES,
    enum: true

  field :ctidTraderAccountId, 2, optional: true, type: :int64
  field :errorCode, 3, required: true, type: :string
  field :description, 4, optional: true, type: :string
  field :maintenanceEndTimestamp, 5, optional: true, type: :int64
  field :retryAfter, 6, optional: true, type: :uint64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAClientDisconnectEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_CLIENT_DISCONNECT_EVENT,
    enum: true

  field :reason, 2, optional: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAccountsTokenInvalidatedEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ACCOUNTS_TOKEN_INVALIDATED_EVENT,
    enum: true

  field :ctidTraderAccountIds, 2, repeated: true, type: :int64
  field :reason, 3, optional: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAVersionReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_VERSION_REQ,
    enum: true
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAVersionRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_VERSION_RES,
    enum: true

  field :version, 2, required: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOANewOrderReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_NEW_ORDER_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, required: true, type: :int64

  field :orderType, 4,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderType,
    enum: true

  field :tradeSide, 5,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATradeSide,
    enum: true

  field :volume, 6, required: true, type: :int64
  field :limitPrice, 7, optional: true, type: :double
  field :stopPrice, 8, optional: true, type: :double

  field :timeInForce, 9,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATimeInForce,
    default: :GOOD_TILL_CANCEL,
    enum: true

  field :expirationTimestamp, 10, optional: true, type: :int64
  field :stopLoss, 11, optional: true, type: :double
  field :takeProfit, 12, optional: true, type: :double
  field :comment, 13, optional: true, type: :string
  field :baseSlippagePrice, 14, optional: true, type: :double
  field :slippageInPoints, 15, optional: true, type: :int32
  field :label, 16, optional: true, type: :string
  field :positionId, 17, optional: true, type: :int64
  field :clientOrderId, 18, optional: true, type: :string
  field :relativeStopLoss, 19, optional: true, type: :int64
  field :relativeTakeProfit, 20, optional: true, type: :int64
  field :guaranteedStopLoss, 21, optional: true, type: :bool
  field :trailingStopLoss, 22, optional: true, type: :bool

  field :stopTriggerMethod, 23,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderTriggerMethod,
    default: :TRADE,
    enum: true
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAExecutionEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_EXECUTION_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64

  field :executionType, 3,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAExecutionType,
    enum: true

  field :position, 4, optional: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPosition
  field :order, 5, optional: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrder
  field :deal, 6, optional: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOADeal

  field :bonusDepositWithdraw, 7,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOABonusDepositWithdraw

  field :depositWithdraw, 8,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOADepositWithdraw

  field :errorCode, 9, optional: true, type: :string
  field :isServerEvent, 10, optional: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOACancelOrderReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_CANCEL_ORDER_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :orderId, 3, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAmendOrderReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_AMEND_ORDER_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :orderId, 3, required: true, type: :int64
  field :volume, 4, optional: true, type: :int64
  field :limitPrice, 5, optional: true, type: :double
  field :stopPrice, 6, optional: true, type: :double
  field :expirationTimestamp, 7, optional: true, type: :int64
  field :stopLoss, 8, optional: true, type: :double
  field :takeProfit, 9, optional: true, type: :double
  field :slippageInPoints, 10, optional: true, type: :int32
  field :relativeStopLoss, 11, optional: true, type: :int64
  field :relativeTakeProfit, 12, optional: true, type: :int64
  field :guaranteedStopLoss, 13, optional: true, type: :bool
  field :trailingStopLoss, 14, optional: true, type: :bool

  field :stopTriggerMethod, 15,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderTriggerMethod,
    default: :TRADE,
    enum: true
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAmendPositionSLTPReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_AMEND_POSITION_SLTP_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :positionId, 3, required: true, type: :int64
  field :stopLoss, 4, optional: true, type: :double
  field :takeProfit, 5, optional: true, type: :double
  field :guaranteedStopLoss, 7, optional: true, type: :bool
  field :trailingStopLoss, 8, optional: true, type: :bool

  field :stopLossTriggerMethod, 9,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderTriggerMethod,
    default: :TRADE,
    enum: true
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAClosePositionReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_CLOSE_POSITION_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :positionId, 3, required: true, type: :int64
  field :volume, 4, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATrailingSLChangedEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_TRAILING_SL_CHANGED_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :positionId, 3, required: true, type: :int64
  field :orderId, 4, required: true, type: :int64
  field :stopPrice, 5, required: true, type: :double
  field :utcLastUpdateTimestamp, 6, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAssetListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ASSET_LIST_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAssetListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ASSET_LIST_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :asset, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAAsset
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolsListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOLS_LIST_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :includeArchivedSymbols, 3, optional: true, type: :bool, default: false
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolsListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOLS_LIST_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbol, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOALightSymbol

  field :archivedSymbol, 4,
    repeated: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAArchivedSymbol
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolByIdReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOL_BY_ID_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, repeated: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolByIdRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOL_BY_ID_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbol, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOASymbol

  field :archivedSymbol, 4,
    repeated: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAArchivedSymbol
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolsForConversionReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOLS_FOR_CONVERSION_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :firstAssetId, 3, required: true, type: :int64
  field :lastAssetId, 4, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolsForConversionRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOLS_FOR_CONVERSION_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbol, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOALightSymbol
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolChangedEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOL_CHANGED_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, repeated: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAssetClassListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ASSET_CLASS_LIST_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAssetClassListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ASSET_CLASS_LIST_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :assetClass, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAAssetClass
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATraderReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_TRADER_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATraderRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_TRADER_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :trader, 3, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrader
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATraderUpdatedEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_TRADER_UPDATE_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :trader, 3, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrader
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAReconcileReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_RECONCILE_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :returnProtectionOrders, 3, optional: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAReconcileRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_RECONCILE_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :position, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPosition
  field :order, 4, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrder
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderErrorEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ORDER_ERROR_EVENT,
    enum: true

  field :ctidTraderAccountId, 5, required: true, type: :int64
  field :errorCode, 2, required: true, type: :string
  field :orderId, 3, optional: true, type: :int64
  field :positionId, 6, optional: true, type: :int64
  field :description, 7, optional: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADealListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_DEAL_LIST_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :fromTimestamp, 3, optional: true, type: :int64
  field :toTimestamp, 4, optional: true, type: :int64
  field :maxRows, 5, optional: true, type: :int32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADealListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_DEAL_LIST_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :deal, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOADeal
  field :hasMore, 4, required: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ORDER_LIST_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :fromTimestamp, 3, optional: true, type: :int64
  field :toTimestamp, 4, optional: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ORDER_LIST_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :order, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrder
  field :hasMore, 4, required: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAExpectedMarginReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_EXPECTED_MARGIN_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, required: true, type: :int64
  field :volume, 4, repeated: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAExpectedMarginRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_EXPECTED_MARGIN_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :margin, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAExpectedMargin
  field :moneyDigits, 4, optional: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginChangedEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_MARGIN_CHANGED_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :positionId, 3, required: true, type: :uint64
  field :usedMargin, 4, required: true, type: :uint64
  field :moneyDigits, 5, optional: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOACashFlowHistoryListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_CASH_FLOW_HISTORY_LIST_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :fromTimestamp, 3, required: true, type: :int64
  field :toTimestamp, 4, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOACashFlowHistoryListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_CASH_FLOW_HISTORY_LIST_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64

  field :depositWithdraw, 3,
    repeated: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOADepositWithdraw
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetAccountListByAccessTokenReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_ACCOUNTS_BY_ACCESS_TOKEN_REQ,
    enum: true

  field :accessToken, 2, required: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetAccountListByAccessTokenRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_ACCOUNTS_BY_ACCESS_TOKEN_RES,
    enum: true

  field :accessToken, 2, required: true, type: :string

  field :permissionScope, 3,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAClientPermissionScope,
    enum: true

  field :ctidTraderAccount, 4,
    repeated: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOACtidTraderAccount
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOARefreshTokenReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_REFRESH_TOKEN_REQ,
    enum: true

  field :refreshToken, 2, required: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOARefreshTokenRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_REFRESH_TOKEN_RES,
    enum: true

  field :accessToken, 2, required: true, type: :string
  field :tokenType, 3, required: true, type: :string
  field :expiresIn, 4, required: true, type: :int64
  field :refreshToken, 5, required: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASubscribeSpotsReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SUBSCRIBE_SPOTS_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, repeated: true, type: :int64
  field :subscribeToSpotTimestamp, 4, optional: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASubscribeSpotsRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SUBSCRIBE_SPOTS_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAUnsubscribeSpotsReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_UNSUBSCRIBE_SPOTS_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, repeated: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAUnsubscribeSpotsRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_UNSUBSCRIBE_SPOTS_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASpotEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SPOT_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, required: true, type: :int64
  field :bid, 4, optional: true, type: :uint64
  field :ask, 5, optional: true, type: :uint64
  field :trendbar, 6, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbar
  field :sessionClose, 7, optional: true, type: :uint64
  field :timestamp, 8, optional: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASubscribeLiveTrendbarReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SUBSCRIBE_LIVE_TRENDBAR_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64

  field :period, 3,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbarPeriod,
    enum: true

  field :symbolId, 4, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASubscribeLiveTrendbarRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SUBSCRIBE_LIVE_TRENDBAR_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAUnsubscribeLiveTrendbarReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_UNSUBSCRIBE_LIVE_TRENDBAR_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64

  field :period, 3,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbarPeriod,
    enum: true

  field :symbolId, 4, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAUnsubscribeLiveTrendbarRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_UNSUBSCRIBE_LIVE_TRENDBAR_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetTrendbarsReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_TRENDBARS_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :fromTimestamp, 3, optional: true, type: :int64
  field :toTimestamp, 4, optional: true, type: :int64

  field :period, 5,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbarPeriod,
    enum: true

  field :symbolId, 6, required: true, type: :int64
  field :count, 7, optional: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetTrendbarsRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_TRENDBARS_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64

  field :period, 3,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbarPeriod,
    enum: true

  field :timestamp, 4, optional: true, type: :int64, deprecated: true
  field :trendbar, 5, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbar
  field :symbolId, 6, optional: true, type: :int64
  field :hasMore, 7, optional: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetTickDataReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_TICKDATA_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, required: true, type: :int64

  field :type, 4,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAQuoteType,
    enum: true

  field :fromTimestamp, 5, optional: true, type: :int64
  field :toTimestamp, 6, optional: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetTickDataRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_TICKDATA_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :tickData, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOATickData
  field :hasMore, 4, required: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetCtidProfileByTokenReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_CTID_PROFILE_BY_TOKEN_REQ,
    enum: true

  field :accessToken, 2, required: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetCtidProfileByTokenRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_CTID_PROFILE_BY_TOKEN_RES,
    enum: true

  field :profile, 2, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOACtidProfile
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADepthEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_DEPTH_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, required: true, type: :uint64
  field :newQuotes, 4, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOADepthQuote
  field :deletedQuotes, 5, repeated: true, type: :uint64, packed: true, deprecated: false
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASubscribeDepthQuotesReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SUBSCRIBE_DEPTH_QUOTES_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, repeated: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASubscribeDepthQuotesRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SUBSCRIBE_DEPTH_QUOTES_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAUnsubscribeDepthQuotesReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_UNSUBSCRIBE_DEPTH_QUOTES_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :symbolId, 3, repeated: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAUnsubscribeDepthQuotesRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_UNSUBSCRIBE_DEPTH_QUOTES_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolCategoryListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOL_CATEGORY_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolCategoryListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_SYMBOL_CATEGORY_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64

  field :symbolCategory, 3,
    repeated: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolCategory
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAccountLogoutReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ACCOUNT_LOGOUT_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAccountLogoutRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ACCOUNT_LOGOUT_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAccountDisconnectEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ACCOUNT_DISCONNECT_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCallListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_MARGIN_CALL_LIST_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCallListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_MARGIN_CALL_LIST_RES,
    enum: true

  field :marginCall, 2, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCall
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCallUpdateReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_MARGIN_CALL_UPDATE_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :marginCall, 3, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCall
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCallUpdateRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_MARGIN_CALL_UPDATE_RES,
    enum: true
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCallUpdateEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_MARGIN_CALL_UPDATE_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :marginCall, 3, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCall
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCallTriggerEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_MARGIN_CALL_TRIGGER_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :marginCall, 3, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCall
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetDynamicLeverageByIDReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_DYNAMIC_LEVERAGE_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :leverageId, 3, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetDynamicLeverageByIDRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_DYNAMIC_LEVERAGE_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64

  field :leverage, 3,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOADynamicLeverage
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADealListByPositionIdReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_DEAL_LIST_BY_POSITION_ID_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :positionId, 3, required: true, type: :int64
  field :fromTimestamp, 4, optional: true, type: :int64
  field :toTimestamp, 5, optional: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADealListByPositionIdRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_DEAL_LIST_BY_POSITION_ID_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :deal, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOADeal
  field :hasMore, 4, required: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderDetailsReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ORDER_DETAILS_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :orderId, 3, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderDetailsRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ORDER_DETAILS_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :order, 3, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrder
  field :deal, 4, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOADeal
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderListByPositionIdReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ORDER_LIST_BY_POSITION_ID_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :positionId, 3, required: true, type: :int64
  field :fromTimestamp, 4, optional: true, type: :int64
  field :toTimestamp, 5, optional: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderListByPositionIdRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_ORDER_LIST_BY_POSITION_ID_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :order, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrder
  field :hasMore, 4, required: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADealOffsetListReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_DEAL_OFFSET_LIST_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :dealId, 3, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADealOffsetListRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_DEAL_OFFSET_LIST_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :offsetBy, 3, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOADealOffset
  field :offsetting, 4, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOADealOffset
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetPositionUnrealizedPnLReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_POSITION_UNREALIZED_PNL_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAGetPositionUnrealizedPnLRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_GET_POSITION_UNREALIZED_PNL_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64

  field :positionUnrealizedPnL, 3,
    repeated: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPositionUnrealizedPnL

  field :moneyDigits, 4, required: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAv1PnLChangeEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_V1_PNL_CHANGE_EVENT,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
  field :grossUnrealizedPnL, 3, required: true, type: :int64
  field :netUnrealizedPnL, 4, required: true, type: :int64
  field :moneyDigits, 5, required: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAv1PnLChangeSubscribeReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_V1_PNL_CHANGE_SUBSCRIBE_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAv1PnLChangeSubscribeRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_V1_PNL_CHANGE_SUBSCRIBE_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAv1PnLChangeUnSubscribeReq do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_V1_PNL_CHANGE_UN_SUBSCRIBE_REQ,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAv1PnLChangeUnSubscribeRes do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :payloadType, 1,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType,
    default: :PROTO_OA_V1_PNL_CHANGE_UN_SUBSCRIBE_RES,
    enum: true

  field :ctidTraderAccountId, 2, required: true, type: :int64
end
