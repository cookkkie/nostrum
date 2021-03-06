defmodule Nostrum.Struct.Emoji do
  @moduledoc """
  Struct representing a Discord emoji.
  """

  @typedoc "Id of the emoji"
  @type id :: integer

  @typedoc "Name of the emoji"
  @type name :: String.t

  @typedoc """
  Custom emoji string to be used with API

  Some API endpoints take an `emoji`.
  The emoji should be structured as `"id:name"`.
  """
  @type custom_emoji :: String.t

  @type t :: %__MODULE__{
    id: id,
    name: name
  }

  @derive [Poison.Encoder]
  defstruct [
    :id,
    :name
  ]

  @doc """
  Formats a custom emoji for use in a Discord message.
  """
  @spec format_custom_emoji(String.t, String.t | integer) :: String.t
  def format_custom_emoji(name, id) when is_binary(id), do: "<:" <> name <> ":" <> id <> ">"
  def format_custom_emoji(name, id) do
    "<:" <> name <> ":" <> to_string(id) <> ">"
  end

  @doc false
  def to_struct(list) when is_list(list), do: list |> Enum.map(&to_struct(&1))
  def to_struct(map) do
    struct(__MODULE__, map)
  end
end
