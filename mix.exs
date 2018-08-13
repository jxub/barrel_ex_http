defmodule Barrel.MixProject do
  use Mix.Project

  @version "0.3.0"

  def project do
    [
      app: :barrel_ex_http,
      version: @version,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "barrel_ex_http",
      source_url: "https://gitlab.com/barrel-db/Clients/barrel_ex_http",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "Barrel-db HTTP API Elixir client"
  end

  defp package do
    [
      name: "barrel_ex_http",
      files: ["config", "lib", "test", "LICENSE", "mix.exs", "README.md"],
      maintainers: ["Jakub Janarek"],
      licenses: ["MIT License"],
      links: %{
        "GitHub" => "https://github.com/jxub/barrel_ex_http",
        "GitLab" => "https://gitlab.com/barrel-db/Clients/barrel_ex_http"
      }
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.1.0"},
      {:jason, "~> 1.0"},
      {:morphix, "~> 0.3.0"},
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:excoveralls, "~> 0.8", only: :test},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
