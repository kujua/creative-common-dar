defmodule DARImageLib.Mixfile do
  use Mix.Project

  def project do
    [app: :dar_imagelib,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :mogrify, :dar_model]]
  end

  defp deps do
    [
      {:mogrify, path: "~/Projects/creative-common-dar/Libs/mogrify"}
    ]
  end

  def getconstant(c) do
    globdefs = %{
      respath: "~/Projects/creative-common-dar/Elixir/Libs/dar_imagelib/test/res/"
    }
    case c do
      :respath -> globdefs.respath
      _ -> ""
    end
  end
end
