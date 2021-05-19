defmodule MixMusic.NotePlayer do
  @moduledoc """
  Plays a `Note`

  Relies on adapters like:
  * `ALSA`'s `aplay`
  """
  alias MixMusic.Note

  require Logger

  @doc """
  Plays a note and logs note information
  """
  def play(%Note{duration: duration, volume: volume} = note) do
    frequency = Note.to_frequency(note)

    Logger.info("Playing Note: #{note.class} #{note.modifier} #{note.octet}")

    ## Got this command from the internet
    cmd("""
    echo 'foo' |  awk '{ for (i = 0; i < #{duration}; i+= 0.00003125) \
    printf("%08X\\n", #{volume}*sin(#{frequency}*3.14*exp((a[$1 % 8]/12)\
    *log(2))*i)) }' | xxd -r -p | aplay -c 2 -f S32_LE -r 28000
    """)
  end

  defp cmd(string) do
    case System.cmd("sh", ["-c", string]) do
      {_, 0} -> :ok
      _ -> :error
    end
  end
end
