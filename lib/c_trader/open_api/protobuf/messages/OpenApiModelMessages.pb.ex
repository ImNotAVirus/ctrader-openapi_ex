defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAPayloadType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :PROTO_OA_APPLICATION_AUTH_REQ, 2100
  field :PROTO_OA_APPLICATION_AUTH_RES, 2101
  field :PROTO_OA_ACCOUNT_AUTH_REQ, 2102
  field :PROTO_OA_ACCOUNT_AUTH_RES, 2103
  field :PROTO_OA_VERSION_REQ, 2104
  field :PROTO_OA_VERSION_RES, 2105
  field :PROTO_OA_NEW_ORDER_REQ, 2106
  field :PROTO_OA_TRAILING_SL_CHANGED_EVENT, 2107
  field :PROTO_OA_CANCEL_ORDER_REQ, 2108
  field :PROTO_OA_AMEND_ORDER_REQ, 2109
  field :PROTO_OA_AMEND_POSITION_SLTP_REQ, 2110
  field :PROTO_OA_CLOSE_POSITION_REQ, 2111
  field :PROTO_OA_ASSET_LIST_REQ, 2112
  field :PROTO_OA_ASSET_LIST_RES, 2113
  field :PROTO_OA_SYMBOLS_LIST_REQ, 2114
  field :PROTO_OA_SYMBOLS_LIST_RES, 2115
  field :PROTO_OA_SYMBOL_BY_ID_REQ, 2116
  field :PROTO_OA_SYMBOL_BY_ID_RES, 2117
  field :PROTO_OA_SYMBOLS_FOR_CONVERSION_REQ, 2118
  field :PROTO_OA_SYMBOLS_FOR_CONVERSION_RES, 2119
  field :PROTO_OA_SYMBOL_CHANGED_EVENT, 2120
  field :PROTO_OA_TRADER_REQ, 2121
  field :PROTO_OA_TRADER_RES, 2122
  field :PROTO_OA_TRADER_UPDATE_EVENT, 2123
  field :PROTO_OA_RECONCILE_REQ, 2124
  field :PROTO_OA_RECONCILE_RES, 2125
  field :PROTO_OA_EXECUTION_EVENT, 2126
  field :PROTO_OA_SUBSCRIBE_SPOTS_REQ, 2127
  field :PROTO_OA_SUBSCRIBE_SPOTS_RES, 2128
  field :PROTO_OA_UNSUBSCRIBE_SPOTS_REQ, 2129
  field :PROTO_OA_UNSUBSCRIBE_SPOTS_RES, 2130
  field :PROTO_OA_SPOT_EVENT, 2131
  field :PROTO_OA_ORDER_ERROR_EVENT, 2132
  field :PROTO_OA_DEAL_LIST_REQ, 2133
  field :PROTO_OA_DEAL_LIST_RES, 2134
  field :PROTO_OA_SUBSCRIBE_LIVE_TRENDBAR_REQ, 2135
  field :PROTO_OA_UNSUBSCRIBE_LIVE_TRENDBAR_REQ, 2136
  field :PROTO_OA_GET_TRENDBARS_REQ, 2137
  field :PROTO_OA_GET_TRENDBARS_RES, 2138
  field :PROTO_OA_EXPECTED_MARGIN_REQ, 2139
  field :PROTO_OA_EXPECTED_MARGIN_RES, 2140
  field :PROTO_OA_MARGIN_CHANGED_EVENT, 2141
  field :PROTO_OA_ERROR_RES, 2142
  field :PROTO_OA_CASH_FLOW_HISTORY_LIST_REQ, 2143
  field :PROTO_OA_CASH_FLOW_HISTORY_LIST_RES, 2144
  field :PROTO_OA_GET_TICKDATA_REQ, 2145
  field :PROTO_OA_GET_TICKDATA_RES, 2146
  field :PROTO_OA_ACCOUNTS_TOKEN_INVALIDATED_EVENT, 2147
  field :PROTO_OA_CLIENT_DISCONNECT_EVENT, 2148
  field :PROTO_OA_GET_ACCOUNTS_BY_ACCESS_TOKEN_REQ, 2149
  field :PROTO_OA_GET_ACCOUNTS_BY_ACCESS_TOKEN_RES, 2150
  field :PROTO_OA_GET_CTID_PROFILE_BY_TOKEN_REQ, 2151
  field :PROTO_OA_GET_CTID_PROFILE_BY_TOKEN_RES, 2152
  field :PROTO_OA_ASSET_CLASS_LIST_REQ, 2153
  field :PROTO_OA_ASSET_CLASS_LIST_RES, 2154
  field :PROTO_OA_DEPTH_EVENT, 2155
  field :PROTO_OA_SUBSCRIBE_DEPTH_QUOTES_REQ, 2156
  field :PROTO_OA_SUBSCRIBE_DEPTH_QUOTES_RES, 2157
  field :PROTO_OA_UNSUBSCRIBE_DEPTH_QUOTES_REQ, 2158
  field :PROTO_OA_UNSUBSCRIBE_DEPTH_QUOTES_RES, 2159
  field :PROTO_OA_SYMBOL_CATEGORY_REQ, 2160
  field :PROTO_OA_SYMBOL_CATEGORY_RES, 2161
  field :PROTO_OA_ACCOUNT_LOGOUT_REQ, 2162
  field :PROTO_OA_ACCOUNT_LOGOUT_RES, 2163
  field :PROTO_OA_ACCOUNT_DISCONNECT_EVENT, 2164
  field :PROTO_OA_SUBSCRIBE_LIVE_TRENDBAR_RES, 2165
  field :PROTO_OA_UNSUBSCRIBE_LIVE_TRENDBAR_RES, 2166
  field :PROTO_OA_MARGIN_CALL_LIST_REQ, 2167
  field :PROTO_OA_MARGIN_CALL_LIST_RES, 2168
  field :PROTO_OA_MARGIN_CALL_UPDATE_REQ, 2169
  field :PROTO_OA_MARGIN_CALL_UPDATE_RES, 2170
  field :PROTO_OA_MARGIN_CALL_UPDATE_EVENT, 2171
  field :PROTO_OA_MARGIN_CALL_TRIGGER_EVENT, 2172
  field :PROTO_OA_REFRESH_TOKEN_REQ, 2173
  field :PROTO_OA_REFRESH_TOKEN_RES, 2174
  field :PROTO_OA_ORDER_LIST_REQ, 2175
  field :PROTO_OA_ORDER_LIST_RES, 2176
  field :PROTO_OA_GET_DYNAMIC_LEVERAGE_REQ, 2177
  field :PROTO_OA_GET_DYNAMIC_LEVERAGE_RES, 2178
  field :PROTO_OA_DEAL_LIST_BY_POSITION_ID_REQ, 2179
  field :PROTO_OA_DEAL_LIST_BY_POSITION_ID_RES, 2180
  field :PROTO_OA_ORDER_DETAILS_REQ, 2181
  field :PROTO_OA_ORDER_DETAILS_RES, 2182
  field :PROTO_OA_ORDER_LIST_BY_POSITION_ID_REQ, 2183
  field :PROTO_OA_ORDER_LIST_BY_POSITION_ID_RES, 2184
  field :PROTO_OA_DEAL_OFFSET_LIST_REQ, 2185
  field :PROTO_OA_DEAL_OFFSET_LIST_RES, 2186
  field :PROTO_OA_GET_POSITION_UNREALIZED_PNL_REQ, 2187
  field :PROTO_OA_GET_POSITION_UNREALIZED_PNL_RES, 2188
  field :PROTO_OA_V1_PNL_CHANGE_EVENT, 2189
  field :PROTO_OA_V1_PNL_CHANGE_SUBSCRIBE_REQ, 2190
  field :PROTO_OA_V1_PNL_CHANGE_SUBSCRIBE_RES, 2191
  field :PROTO_OA_V1_PNL_CHANGE_UN_SUBSCRIBE_REQ, 2192
  field :PROTO_OA_V1_PNL_CHANGE_UN_SUBSCRIBE_RES, 2193
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADayOfWeek do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :NONE, 0
  field :MONDAY, 1
  field :TUESDAY, 2
  field :WEDNESDAY, 3
  field :THURSDAY, 4
  field :FRIDAY, 5
  field :SATURDAY, 6
  field :SUNDAY, 7
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOACommissionType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :USD_PER_MILLION_USD, 1
  field :USD_PER_LOT, 2
  field :PERCENTAGE_OF_VALUE, 3
  field :QUOTE_CCY_PER_LOT, 4
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolDistanceType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :SYMBOL_DISTANCE_IN_POINTS, 1
  field :SYMBOL_DISTANCE_IN_PERCENTAGE, 2
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMinCommissionType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :CURRENCY, 1
  field :QUOTE_CURRENCY, 2
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATradingMode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :ENABLED, 0
  field :DISABLED_WITHOUT_PENDINGS_EXECUTION, 1
  field :DISABLED_WITH_PENDINGS_EXECUTION, 2
  field :CLOSE_ONLY_MODE, 3
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASwapCalculationType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :PIPS, 0
  field :PERCENTAGE, 1
  field :POINTS, 2
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAccessRights do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :FULL_ACCESS, 0
  field :CLOSE_ONLY, 1
  field :NO_TRADING, 2
  field :NO_LOGIN, 3
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATotalMarginCalculationType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :MAX, 0
  field :SUM, 1
  field :NET, 2
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAccountType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :HEDGED, 0
  field :NETTED, 1
  field :SPREAD_BETTING, 2
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAPositionStatus do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :POSITION_STATUS_OPEN, 1
  field :POSITION_STATUS_CLOSED, 2
  field :POSITION_STATUS_CREATED, 3
  field :POSITION_STATUS_ERROR, 4
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATradeSide do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :BUY, 1
  field :SELL, 2
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :MARKET, 1
  field :LIMIT, 2
  field :STOP, 3
  field :STOP_LOSS_TAKE_PROFIT, 4
  field :MARKET_RANGE, 5
  field :STOP_LIMIT, 6
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATimeInForce do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :GOOD_TILL_DATE, 1
  field :GOOD_TILL_CANCEL, 2
  field :IMMEDIATE_OR_CANCEL, 3
  field :FILL_OR_KILL, 4
  field :MARKET_ON_OPEN, 5
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderStatus do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :ORDER_STATUS_ACCEPTED, 1
  field :ORDER_STATUS_FILLED, 2
  field :ORDER_STATUS_REJECTED, 3
  field :ORDER_STATUS_EXPIRED, 4
  field :ORDER_STATUS_CANCELLED, 5
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderTriggerMethod do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :TRADE, 1
  field :OPPOSITE, 2
  field :DOUBLE_TRADE, 3
  field :DOUBLE_OPPOSITE, 4
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAExecutionType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :ORDER_ACCEPTED, 2
  field :ORDER_FILLED, 3
  field :ORDER_REPLACED, 4
  field :ORDER_CANCELLED, 5
  field :ORDER_EXPIRED, 6
  field :ORDER_REJECTED, 7
  field :ORDER_CANCEL_REJECTED, 8
  field :SWAP, 9
  field :DEPOSIT_WITHDRAW, 10
  field :ORDER_PARTIAL_FILL, 11
  field :BONUS_DEPOSIT_WITHDRAW, 12
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAChangeBonusType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :BONUS_DEPOSIT, 0
  field :BONUS_WITHDRAW, 1
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAChangeBalanceType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :BALANCE_DEPOSIT, 0
  field :BALANCE_WITHDRAW, 1
  field :BALANCE_DEPOSIT_STRATEGY_COMMISSION_INNER, 3
  field :BALANCE_WITHDRAW_STRATEGY_COMMISSION_INNER, 4
  field :BALANCE_DEPOSIT_IB_COMMISSIONS, 5
  field :BALANCE_WITHDRAW_IB_SHARED_PERCENTAGE, 6
  field :BALANCE_DEPOSIT_IB_SHARED_PERCENTAGE_FROM_SUB_IB, 7
  field :BALANCE_DEPOSIT_IB_SHARED_PERCENTAGE_FROM_BROKER, 8
  field :BALANCE_DEPOSIT_REBATE, 9
  field :BALANCE_WITHDRAW_REBATE, 10
  field :BALANCE_DEPOSIT_STRATEGY_COMMISSION_OUTER, 11
  field :BALANCE_WITHDRAW_STRATEGY_COMMISSION_OUTER, 12
  field :BALANCE_WITHDRAW_BONUS_COMPENSATION, 13
  field :BALANCE_WITHDRAW_IB_SHARED_PERCENTAGE_TO_BROKER, 14
  field :BALANCE_DEPOSIT_DIVIDENDS, 15
  field :BALANCE_WITHDRAW_DIVIDENDS, 16
  field :BALANCE_WITHDRAW_GSL_CHARGE, 17
  field :BALANCE_WITHDRAW_ROLLOVER, 18
  field :BALANCE_DEPOSIT_NONWITHDRAWABLE_BONUS, 19
  field :BALANCE_WITHDRAW_NONWITHDRAWABLE_BONUS, 20
  field :BALANCE_DEPOSIT_SWAP, 21
  field :BALANCE_WITHDRAW_SWAP, 22
  field :BALANCE_DEPOSIT_MANAGEMENT_FEE, 27
  field :BALANCE_WITHDRAW_MANAGEMENT_FEE, 28
  field :BALANCE_DEPOSIT_PERFORMANCE_FEE, 29
  field :BALANCE_WITHDRAW_FOR_SUBACCOUNT, 30
  field :BALANCE_DEPOSIT_TO_SUBACCOUNT, 31
  field :BALANCE_WITHDRAW_FROM_SUBACCOUNT, 32
  field :BALANCE_DEPOSIT_FROM_SUBACCOUNT, 33
  field :BALANCE_WITHDRAW_COPY_FEE, 34
  field :BALANCE_WITHDRAW_INACTIVITY_FEE, 35
  field :BALANCE_DEPOSIT_TRANSFER, 36
  field :BALANCE_WITHDRAW_TRANSFER, 37
  field :BALANCE_DEPOSIT_CONVERTED_BONUS, 38
  field :BALANCE_DEPOSIT_NEGATIVE_BALANCE_PROTECTION, 39
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADealStatus do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :FILLED, 2
  field :PARTIALLY_FILLED, 3
  field :REJECTED, 4
  field :INTERNALLY_REJECTED, 5
  field :ERROR, 6
  field :MISSED, 7
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbarPeriod do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :M1, 1
  field :M2, 2
  field :M3, 3
  field :M4, 4
  field :M5, 5
  field :M10, 6
  field :M15, 7
  field :M30, 8
  field :H1, 9
  field :H4, 10
  field :H12, 11
  field :D1, 12
  field :W1, 13
  field :MN1, 14
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAQuoteType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :BID, 1
  field :ASK, 2
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAClientPermissionScope do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :SCOPE_VIEW, 0
  field :SCOPE_TRADE, 1
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOANotificationType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :MARGIN_LEVEL_THRESHOLD_1, 61
  field :MARGIN_LEVEL_THRESHOLD_2, 62
  field :MARGIN_LEVEL_THRESHOLD_3, 63
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAErrorCode do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :OA_AUTH_TOKEN_EXPIRED, 1
  field :ACCOUNT_NOT_AUTHORIZED, 2
  field :RET_NO_SUCH_LOGIN, 12
  field :ALREADY_LOGGED_IN, 14
  field :RET_ACCOUNT_DISABLED, 64
  field :CH_CLIENT_AUTH_FAILURE, 101
  field :CH_CLIENT_NOT_AUTHENTICATED, 102
  field :CH_CLIENT_ALREADY_AUTHENTICATED, 103
  field :CH_ACCESS_TOKEN_INVALID, 104
  field :CH_SERVER_NOT_REACHABLE, 105
  field :CH_CTID_TRADER_ACCOUNT_NOT_FOUND, 106
  field :CH_OA_CLIENT_NOT_FOUND, 107
  field :REQUEST_FREQUENCY_EXCEEDED, 108
  field :SERVER_IS_UNDER_MAINTENANCE, 109
  field :CHANNEL_IS_BLOCKED, 110
  field :CONNECTIONS_LIMIT_EXCEEDED, 67
  field :WORSE_GSL_NOT_ALLOWED, 68
  field :SYMBOL_HAS_HOLIDAY, 69
  field :NOT_SUBSCRIBED_TO_SPOTS, 112
  field :ALREADY_SUBSCRIBED, 113
  field :SYMBOL_NOT_FOUND, 114
  field :UNKNOWN_SYMBOL, 115
  field :INCORRECT_BOUNDARIES, 35
  field :NO_QUOTES, 117
  field :NOT_ENOUGH_MONEY, 118
  field :MAX_EXPOSURE_REACHED, 119
  field :POSITION_NOT_FOUND, 120
  field :ORDER_NOT_FOUND, 121
  field :POSITION_NOT_OPEN, 122
  field :POSITION_LOCKED, 123
  field :TOO_MANY_POSITIONS, 124
  field :TRADING_BAD_VOLUME, 125
  field :TRADING_BAD_STOPS, 126
  field :TRADING_BAD_PRICES, 127
  field :TRADING_BAD_STAKE, 128
  field :PROTECTION_IS_TOO_CLOSE_TO_MARKET, 129
  field :TRADING_BAD_EXPIRATION_DATE, 130
  field :PENDING_EXECUTION, 131
  field :TRADING_DISABLED, 132
  field :TRADING_NOT_ALLOWED, 133
  field :UNABLE_TO_CANCEL_ORDER, 134
  field :UNABLE_TO_AMEND_ORDER, 135
  field :SHORT_SELLING_NOT_ALLOWED, 136
  field :NOT_SUBSCRIBED_TO_PNL, 137
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOALimitedRiskMarginCalculationStrategy do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :ACCORDING_TO_LEVERAGE, 0
  field :ACCORDING_TO_GSL, 1
  field :ACCORDING_TO_GSL_AND_LEVERAGE, 2
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAStopOutStrategy do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :MOST_MARGIN_USED_FIRST, 0
  field :MOST_LOSING_FIRST, 1
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAsset do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :assetId, 1, required: true, type: :int64
  field :name, 2, required: true, type: :string
  field :displayName, 3, optional: true, type: :string
  field :digits, 4, optional: true, type: :int32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbol do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :symbolId, 1, required: true, type: :int64
  field :digits, 2, required: true, type: :int32
  field :pipPosition, 3, required: true, type: :int32
  field :enableShortSelling, 4, optional: true, type: :bool
  field :guaranteedStopLoss, 5, optional: true, type: :bool

  field :swapRollover3Days, 6,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOADayOfWeek,
    default: :MONDAY,
    enum: true

  field :swapLong, 7, optional: true, type: :double
  field :swapShort, 8, optional: true, type: :double
  field :maxVolume, 9, optional: true, type: :int64
  field :minVolume, 10, optional: true, type: :int64
  field :stepVolume, 11, optional: true, type: :int64
  field :maxExposure, 12, optional: true, type: :uint64
  field :schedule, 13, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAInterval
  field :commission, 14, optional: true, type: :int64, deprecated: true

  field :commissionType, 15,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOACommissionType,
    default: :USD_PER_MILLION_USD,
    enum: true

  field :slDistance, 16, optional: true, type: :uint32
  field :tpDistance, 17, optional: true, type: :uint32
  field :gslDistance, 18, optional: true, type: :uint32
  field :gslCharge, 19, optional: true, type: :int64

  field :distanceSetIn, 20,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolDistanceType,
    default: :SYMBOL_DISTANCE_IN_POINTS,
    enum: true

  field :minCommission, 21, optional: true, type: :int64, deprecated: true

  field :minCommissionType, 22,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAMinCommissionType,
    default: :CURRENCY,
    enum: true

  field :minCommissionAsset, 23, optional: true, type: :string, default: "USD"
  field :rolloverCommission, 24, optional: true, type: :int64
  field :skipRolloverDays, 25, optional: true, type: :int32
  field :scheduleTimeZone, 26, optional: true, type: :string

  field :tradingMode, 27,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATradingMode,
    default: :ENABLED,
    enum: true

  field :rolloverCommission3Days, 28,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOADayOfWeek,
    default: :MONDAY,
    enum: true

  field :swapCalculationType, 29,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOASwapCalculationType,
    default: :PIPS,
    enum: true

  field :lotSize, 30, optional: true, type: :int64
  field :preciseTradingCommissionRate, 31, optional: true, type: :int64
  field :preciseMinCommission, 32, optional: true, type: :int64
  field :holiday, 33, repeated: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOAHoliday
  field :pnlConversionFeeRate, 34, optional: true, type: :int32
  field :leverageId, 35, optional: true, type: :int64
  field :swapPeriod, 36, optional: true, type: :int32
  field :swapTime, 37, optional: true, type: :int32
  field :skipSWAPPeriods, 38, optional: true, type: :int32
  field :chargeSwapAtWeekends, 39, optional: true, type: :bool
  field :measurementUnits, 40, optional: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOALightSymbol do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :symbolId, 1, required: true, type: :int64
  field :symbolName, 2, optional: true, type: :string
  field :enabled, 3, optional: true, type: :bool
  field :baseAssetId, 4, optional: true, type: :int64
  field :quoteAssetId, 5, optional: true, type: :int64
  field :symbolCategoryId, 6, optional: true, type: :int64
  field :description, 7, optional: true, type: :string
  field :sortingNumber, 8, optional: true, type: :double
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAArchivedSymbol do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :symbolId, 1, required: true, type: :int64
  field :name, 2, required: true, type: :string
  field :utcLastUpdateTimestamp, 3, required: true, type: :int64
  field :description, 4, optional: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOASymbolCategory do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :id, 1, required: true, type: :int64
  field :assetClassId, 2, required: true, type: :int64
  field :name, 3, required: true, type: :string
  field :sortingNumber, 4, optional: true, type: :double
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAInterval do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :startSecond, 3, required: true, type: :uint32
  field :endSecond, 4, required: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATrader do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :ctidTraderAccountId, 1, required: true, type: :int64
  field :balance, 2, required: true, type: :int64
  field :balanceVersion, 3, optional: true, type: :int64
  field :managerBonus, 4, optional: true, type: :int64
  field :ibBonus, 5, optional: true, type: :int64
  field :nonWithdrawableBonus, 6, optional: true, type: :int64

  field :accessRights, 7,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAAccessRights,
    default: :FULL_ACCESS,
    enum: true

  field :depositAssetId, 8, required: true, type: :int64
  field :swapFree, 9, optional: true, type: :bool
  field :leverageInCents, 10, optional: true, type: :uint32

  field :totalMarginCalculationType, 11,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATotalMarginCalculationType,
    enum: true

  field :maxLeverage, 12, optional: true, type: :uint32
  field :frenchRisk, 13, optional: true, type: :bool, deprecated: true
  field :traderLogin, 14, optional: true, type: :int64

  field :accountType, 15,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAAccountType,
    default: :HEDGED,
    enum: true

  field :brokerName, 16, optional: true, type: :string
  field :registrationTimestamp, 17, optional: true, type: :int64
  field :isLimitedRisk, 18, optional: true, type: :bool

  field :limitedRiskMarginCalculationStrategy, 19,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOALimitedRiskMarginCalculationStrategy,
    default: :ACCORDING_TO_LEVERAGE,
    enum: true

  field :moneyDigits, 20, optional: true, type: :uint32
  field :fairStopOut, 21, optional: true, type: :bool

  field :stopOutStrategy, 22,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAStopOutStrategy,
    default: :MOST_MARGIN_USED_FIRST,
    enum: true
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAPosition do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :positionId, 1, required: true, type: :int64
  field :tradeData, 2, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOATradeData

  field :positionStatus, 3,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAPositionStatus,
    enum: true

  field :swap, 4, required: true, type: :int64
  field :price, 5, optional: true, type: :double
  field :stopLoss, 6, optional: true, type: :double
  field :takeProfit, 7, optional: true, type: :double
  field :utcLastUpdateTimestamp, 8, optional: true, type: :int64
  field :commission, 9, optional: true, type: :int64
  field :marginRate, 10, optional: true, type: :double
  field :mirroringCommission, 11, optional: true, type: :int64
  field :guaranteedStopLoss, 12, optional: true, type: :bool
  field :usedMargin, 13, optional: true, type: :uint64

  field :stopLossTriggerMethod, 14,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderTriggerMethod,
    default: :TRADE,
    enum: true

  field :moneyDigits, 15, optional: true, type: :uint32
  field :trailingStopLoss, 16, optional: true, type: :bool
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATradeData do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :symbolId, 1, required: true, type: :int64
  field :volume, 2, required: true, type: :int64

  field :tradeSide, 3,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATradeSide,
    enum: true

  field :openTimestamp, 4, optional: true, type: :int64
  field :label, 5, optional: true, type: :string
  field :guaranteedStopLoss, 6, optional: true, type: :bool
  field :comment, 7, optional: true, type: :string
  field :measurementUnits, 8, optional: true, type: :string
  field :closeTimestamp, 9, optional: true, type: :uint64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAOrder do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :orderId, 1, required: true, type: :int64
  field :tradeData, 2, required: true, type: CTrader.OpenApi.Protobuf.Messages.ProtoOATradeData

  field :orderType, 3,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderType,
    enum: true

  field :orderStatus, 4,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderStatus,
    enum: true

  field :expirationTimestamp, 6, optional: true, type: :int64
  field :executionPrice, 7, optional: true, type: :double
  field :executedVolume, 8, optional: true, type: :int64
  field :utcLastUpdateTimestamp, 9, optional: true, type: :int64
  field :baseSlippagePrice, 10, optional: true, type: :double
  field :slippageInPoints, 11, optional: true, type: :int64
  field :closingOrder, 12, optional: true, type: :bool
  field :limitPrice, 13, optional: true, type: :double
  field :stopPrice, 14, optional: true, type: :double
  field :stopLoss, 15, optional: true, type: :double
  field :takeProfit, 16, optional: true, type: :double
  field :clientOrderId, 17, optional: true, type: :string

  field :timeInForce, 18,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATimeInForce,
    default: :IMMEDIATE_OR_CANCEL,
    enum: true

  field :positionId, 19, optional: true, type: :int64
  field :relativeStopLoss, 20, optional: true, type: :int64
  field :relativeTakeProfit, 21, optional: true, type: :int64
  field :isStopOut, 22, optional: true, type: :bool
  field :trailingStopLoss, 23, optional: true, type: :bool

  field :stopTriggerMethod, 24,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAOrderTriggerMethod,
    default: :TRADE,
    enum: true
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOABonusDepositWithdraw do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :operationType, 1,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAChangeBonusType,
    enum: true

  field :bonusHistoryId, 2, required: true, type: :int64
  field :managerBonus, 3, required: true, type: :int64
  field :managerDelta, 4, required: true, type: :int64
  field :ibBonus, 5, required: true, type: :int64
  field :ibDelta, 6, required: true, type: :int64
  field :changeBonusTimestamp, 7, required: true, type: :int64
  field :externalNote, 8, optional: true, type: :string
  field :introducingBrokerId, 9, optional: true, type: :int64
  field :moneyDigits, 10, optional: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADepositWithdraw do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :operationType, 1,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAChangeBalanceType,
    enum: true

  field :balanceHistoryId, 2, required: true, type: :int64
  field :balance, 3, required: true, type: :int64
  field :delta, 4, required: true, type: :int64
  field :changeBalanceTimestamp, 5, required: true, type: :int64
  field :externalNote, 6, optional: true, type: :string
  field :balanceVersion, 7, optional: true, type: :int64
  field :equity, 8, optional: true, type: :int64
  field :moneyDigits, 9, optional: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADeal do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :dealId, 1, required: true, type: :int64
  field :orderId, 2, required: true, type: :int64
  field :positionId, 3, required: true, type: :int64
  field :volume, 4, required: true, type: :int64
  field :filledVolume, 5, required: true, type: :int64
  field :symbolId, 6, required: true, type: :int64
  field :createTimestamp, 7, required: true, type: :int64
  field :executionTimestamp, 8, required: true, type: :int64
  field :utcLastUpdateTimestamp, 9, optional: true, type: :int64
  field :executionPrice, 10, optional: true, type: :double

  field :tradeSide, 11,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATradeSide,
    enum: true

  field :dealStatus, 12,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOADealStatus,
    enum: true

  field :marginRate, 13, optional: true, type: :double
  field :commission, 14, optional: true, type: :int64
  field :baseToUsdConversionRate, 15, optional: true, type: :double

  field :closePositionDetail, 16,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOAClosePositionDetail

  field :moneyDigits, 17, optional: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADealOffset do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :dealId, 1, required: true, type: :int64
  field :volume, 2, required: true, type: :int64
  field :executionTimestamp, 3, optional: true, type: :int64
  field :executionPrice, 4, optional: true, type: :double
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAClosePositionDetail do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :entryPrice, 1, required: true, type: :double
  field :grossProfit, 2, required: true, type: :int64
  field :swap, 3, required: true, type: :int64
  field :commission, 4, required: true, type: :int64
  field :balance, 5, required: true, type: :int64
  field :quoteToDepositConversionRate, 6, optional: true, type: :double
  field :closedVolume, 7, optional: true, type: :int64
  field :balanceVersion, 8, optional: true, type: :int64
  field :moneyDigits, 9, optional: true, type: :uint32
  field :pnlConversionFee, 10, optional: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbar do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :volume, 3, required: true, type: :int64

  field :period, 4,
    optional: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOATrendbarPeriod,
    default: :M1,
    enum: true

  field :low, 5, optional: true, type: :int64
  field :deltaOpen, 6, optional: true, type: :uint64
  field :deltaClose, 7, optional: true, type: :uint64
  field :deltaHigh, 8, optional: true, type: :uint64
  field :utcTimestampInMinutes, 9, optional: true, type: :uint32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAExpectedMargin do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :volume, 1, required: true, type: :int64
  field :buyMargin, 2, required: true, type: :int64
  field :sellMargin, 3, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOATickData do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :timestamp, 1, required: true, type: :int64
  field :tick, 2, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOACtidProfile do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :userId, 1, required: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOACtidTraderAccount do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :ctidTraderAccountId, 1, required: true, type: :uint64
  field :isLive, 2, optional: true, type: :bool
  field :traderLogin, 3, optional: true, type: :int64
  field :lastClosingDealTimestamp, 4, optional: true, type: :int64
  field :lastBalanceUpdateTimestamp, 5, optional: true, type: :int64
  field :brokerTitleShort, 6, optional: true, type: :string
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAAssetClass do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :id, 1, optional: true, type: :int64
  field :name, 2, optional: true, type: :string
  field :sortingNumber, 3, optional: true, type: :double
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADepthQuote do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :id, 1, required: true, type: :uint64
  field :size, 3, required: true, type: :uint64
  field :bid, 4, optional: true, type: :uint64
  field :ask, 5, optional: true, type: :uint64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAMarginCall do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :marginCallType, 1,
    required: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOANotificationType,
    enum: true

  field :marginLevelThreshold, 2, required: true, type: :double
  field :utcLastUpdateTimestamp, 3, optional: true, type: :int64
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAHoliday do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :holidayId, 1, required: true, type: :int64
  field :name, 2, required: true, type: :string
  field :description, 3, optional: true, type: :string
  field :scheduleTimeZone, 4, required: true, type: :string
  field :holidayDate, 5, required: true, type: :int64
  field :isRecurring, 6, required: true, type: :bool
  field :startSecond, 7, optional: true, type: :int32
  field :endSecond, 8, optional: true, type: :int32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADynamicLeverage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :leverageId, 1, required: true, type: :int64

  field :tiers, 2,
    repeated: true,
    type: CTrader.OpenApi.Protobuf.Messages.ProtoOADynamicLeverageTier
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOADynamicLeverageTier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :volume, 1, required: true, type: :int64
  field :leverage, 2, required: true, type: :int32
end

defmodule CTrader.OpenApi.Protobuf.Messages.ProtoOAPositionUnrealizedPnL do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto2

  field :positionId, 1, required: true, type: :int64
  field :grossUnrealizedPnL, 2, required: true, type: :int64
  field :netUnrealizedPnL, 3, required: true, type: :int64
end
