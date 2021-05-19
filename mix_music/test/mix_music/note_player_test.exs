defmodule MixMusic.NotePlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureLog

  alias MixMusic.{Note, NotePlayer}

  describe "play/1" do
    test "plays a note (not testing alsa)" do
      note = struct!(Note, %{class: :a, octet: 4})

      assert capture_log(fn ->
               assert NotePlayer.play(note) == :ok
             end) =~ "Played Note: a base 4"
    end
  end
end
