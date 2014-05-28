defmodule Exmerl.Mixfile do
  use Mix.Project

  def project do
    [app: :exmerl,
     version: "0.1.1",
     elixir: ">= 0.13.2",
     deps: [],
     package: package,
     description: description
    ]
  end

  defp package do
    [
      files: ["lib", "Makefile", "mix.exs", "README.md"],
      contributors: ["Paul Woolcock"],
      licenses: ["Apache 2.0"],
      links: %{ "GitHub" => "https://github.com/pwoolcoc/exmerl" }
    ]
  end

  defp description do
    """
    An Elixir wrapper for parsing XML through the xmerl_* suite of modules
    """
  end
end
