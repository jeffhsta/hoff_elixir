defmodule Hoff.MixProject do
  use Mix.Project

  def project do
    [
      app: :hoff,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Hoff.Application, []}
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.4", only: :dev},
      {:floki, "~> 0.26.0"},
      {:httpoison, "~> 1.7"}
    ]
  end

  defp aliases do
    [
      {:lint, "credo --strict"}
    ]
  end
end
