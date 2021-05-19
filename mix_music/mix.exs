defmodule MixMusic.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :mix_music,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end
