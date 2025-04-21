defmodule CTrader.OpenApi.OHLCVBar do
  @moduledoc """
  Represents an Open High Low Close Volume bar.
  """

  alias __MODULE__

  alias CTrader.OpenApi.Protobuf.Messages.{
    ProtoOASymbol,
    ProtoOATrendbar,
    ProtoOATrendbarPeriod
  }

  @enforce_keys [:time, :open, :high, :low, :close, :volume, :period]
  defstruct @enforce_keys

  @type t :: %OHLCVBar{
          time: DateTime.t(),
          open: float(),
          high: float(),
          low: float(),
          close: float(),
          volume: pos_integer(),
          period: ProtoOATrendbarPeriod.t()
        }

  ## Public API

  def from_trendbar(%ProtoOATrendbar{} = bar, %ProtoOASymbol{} = symbol) do
    %{
      utcTimestampInMinutes: time,
      low: low,
      deltaOpen: delta_open,
      deltaClose: delta_close,
      deltaHigh: delta_high,
      volume: volume,
      period: period
    } = bar

    %OHLCVBar{
      time: DateTime.from_unix!(time * :timer.minutes(1), :millisecond),
      open: price_from_relative(low + delta_open, symbol),
      high: price_from_relative(low + delta_high, symbol),
      low: price_from_relative(low, symbol),
      close: price_from_relative(low + delta_close, symbol),
      volume: volume,
      period: period
    }
  end

  def from_trendbars(bars, %ProtoOASymbol{} = symbol) when is_list(bars) do
    Enum.map(bars, &from_trendbar(&1, symbol))
  end

  ## Private functions

  defp price_from_relative(price, %ProtoOASymbol{digits: digits}) do
    Float.round(price / 100_000, digits)
  end
end
