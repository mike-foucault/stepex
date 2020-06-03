defmodule Stepex do
  alias __MODULE__

  defstruct status: :ok,
            data: nil,
            callback: &__MODULE__.default_callback/2,
            metadata: %{},
            context: %{}

  def default_callback(_data, _context), do: fn -> nil end

  def init(data \\ %{}), do: %Stepex{data: data}

  def update_data(%Stepex{} = message, fun) when is_function(fun, 2),
    do: %Stepex{message | data: fun.(message.data, message.context)}

  def read_data(%Stepex{data: data}), do: data

  def put_callback(%Stepex{} = message, callback) when is_function(callback, 2),
    do: %Stepex{message | callback: callback}

  def run_callback(%Stepex{callback: callback} = message) when is_function(callback, 2) do
    callback.(message.data, message.context)
    message
  end

  def put_metadata(%Stepex{} = message, metadata),
    do: %Stepex{message | metadata: metadata}

  def read_metadata(%Stepex{metadata: metadata}), do: metadata

  def put_context(%Stepex{} = message, context),
    do: %Stepex{message | context: context}

  def read_context(%Stepex{context: context}), do: context

  def format_response(%Stepex{data: data}), do: {:ok, data}
end
