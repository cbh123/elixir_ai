defmodule AI.MixProject do
  use Mix.Project

  def project do
    [
      app: :ai,
      version: "0.3.4",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "AI",
      source_url: "https://github.com/cbh123/elixir_ai",
      homepage_url: "https://hexdocs.pm/ai/readme.html",
      package: package(),
      description: description(),
      docs: [
        main: "readme",
        extras: ["README.md", "CHANGELOG.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:openai, "> 0.5.2"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Helper functions for using AI in Elixir"
  end

  defp package() do
    [
      name: "ai",
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/cbh123/elixir_ai"}
    ]
  end
end
