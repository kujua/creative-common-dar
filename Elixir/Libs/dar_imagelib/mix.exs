defmodule DarImagelib.Mixfile do
  use Mix.Project

  def project do
    [app: :dar_imagelib,
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
    [mod: {DarImagelib.App, []},
    applications: [:logger,:mogrify]]
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
        {:mogrify, path: "~/Projects/mogrify"},
        {:dar_model, path: "~/Projects/creative-common-dar/Erlang/Libs/dar_model"},
        {:ex_doc, "~> 0.11", only: :dev}
    ]
  end

  def getconstant(c) do
    globdefs = %{
      respath: "/Users/Wolfgang/Projects/creative-common-dar/Elixir/Libs/dar_imagelib/test/res/"
    }
    case c do
      :respath -> globdefs.respath
      _ -> ""
    end
  end

end
