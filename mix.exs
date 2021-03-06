defmodule TrotExample.Mixfile do
  use Mix.Project

  def project do
    [app: :tdbackend,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :trot, :exjsx]]
  end

  defp deps do
    [{:trot, github: "hexedpackets/trot"}, {:exjsx, github: "talentdeficit/exjsx"}]
  end
end
