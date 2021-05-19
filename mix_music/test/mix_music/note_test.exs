defmodule MixMusic.NoteTest do
  use ExUnit.Case

  alias MixMusic.Note

  describe "defstruct with proper keys" do
    test "has expected fields" do
      expected_keys = ~w(class modifier octet duration volume)a

      final_keys =
        Note.__struct__()
        |> Map.keys()
        |> List.delete(:__struct__)

      assert Enum.sort(expected_keys) == Enum.sort(final_keys)
    end
  end

  describe "to_frequency/1" do
    test "converts a non-rest note to frequency" do
      note = struct!(Note, %{class: :a, octet: 4})

      assert Note.to_frequency(note) == 440
    end

    test "converts a rest note to frequency" do
      note = struct!(Note, %{class: :rest, octet: 4})

      assert Note.to_frequency(note) == 0
    end
  end
end
