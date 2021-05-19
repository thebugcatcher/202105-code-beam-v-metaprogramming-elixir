defmodule MixMusic.DSL do
  @moduledoc """
  DSL to compose music in Elixir
  """

  # Use this with note/2 macro
  def note_from_options(class, options) do
    params =
      options
      |> Keyword.put(:class, class)
      |> Enum.into(%{})

    struct!(MixMusic.Note, params)
  end
end
