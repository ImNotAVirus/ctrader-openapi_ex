defmodule CTrader.OpenApi.Protobuf.ProtobufBinary do
  @moduledoc """
  Protobuf custom encoder/decoder
  """

  alias CTrader.OpenApi.Protobuf.Messages.ProtoMessage

  ## Public API

  def encode(%mod{} = struct, opts \\ []) do
    # Wrap structure into a ProtoMessage struct
    struct =
      %ProtoMessage{
        payloadType: payload_type_value(struct),
        payload: mod.encode(struct),
        clientMsgId: Keyword.get(opts, :client_msg_id)
      }

    ProtoMessage.encode(struct)
  end

  def decode(data) do
    %ProtoMessage{
      payloadType: payload_type,
      payload: payload
    } = message = ProtoMessage.decode(data)

    mapping = messages_mapping()
    module = Map.fetch!(mapping, payload_type)

    %ProtoMessage{message | payload: module.decode(payload)}
  end

  def decode_payload(data) do
    decode(data).payload
  end

  ## Private functions

  defp messages_mapping() do
    case :persistent_term.get(:ctrader_proto_messages, :not_found) do
      :not_found ->
        :persistent_term.put(:ctrader_proto_messages, fetch_messages_mapping())
        messages_mapping()

      value ->
        value
    end
  end

  defp fetch_messages_mapping() do
    {:ok, list} = :application.get_key(:ctrader_open_api, :modules)

    list
    # Filter Protobuf modules
    |> Enum.filter(fn module ->
      module
      |> Atom.to_string()
      |> String.starts_with?("Elixir.CTrader.OpenApi.Protobuf.Messages.")
    end)
    # Keep only messages (reject enums)
    |> Enum.filter(&Map.has_key?(&1.__struct__(), :payloadType))
    # Remove ProtoMessage
    |> List.delete(CTrader.OpenApi.Protobuf.Messages.ProtoMessage)
    |> Map.new(&{payload_type_value(&1.__struct__()), &1})
  end

  defp payload_type_value(%mod{payloadType: payload_type}) do
    # FIXME: I'm not sure if relying on internal impl is the best way
    %Protobuf.MessageProps{
      field_tags: %{payloadType: payload_type_id},
      field_props: field_props
    } = mod.__message_props__()

    %Protobuf.FieldProps{type: type} = Map.fetch!(field_props, payload_type_id)
    {:enum, enum_mod} = type

    enum_mod.value(payload_type)
  end
end
