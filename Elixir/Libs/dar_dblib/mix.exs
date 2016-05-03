defmodule DarDblib.Mixfile do
  use Mix.Project

  def project do
    [app: :dar_dblib,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
        mod: {DarDblib.App, []},
        applications: [:logger, :mongodb_ecto, :ecto]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
        {:mongodb_ecto, "~> 0.1"},
        {:dar_model, path: "~/Projects/creative-common-dar/Erlang/Libs/dar_model"},
        {:meck, git: "https://github.com/eproxus/meck.git"}
    ]
  end
end
