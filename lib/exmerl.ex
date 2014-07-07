defmodule Exmerl do
  @moduledoc ~s"""
  Exmerl is an Elixir wrapper around xmerl_*.

  Currently not very much is supported, only parsing
  xml into elixir data, and selecting elements through Xpath
  expressions.
  """

  @typedoc "The parsed XML document"
  @type document :: term

  @typedoc "Rest"
  @type rest :: [term]

  @typedoc "keys for option lists"
  @type key :: atom

  @typedoc "values for option lists"
  @type value :: term

  @doc """
  Parses xml from a file. See http://www.erlang.org/doc/man/xmerl_scan.html
  for a description of the available options
  """
  @spec from_file(String.t, [{key, value}]) :: {document, rest}
  def from_file(fname, opts \\ []) do
    :xmerl_scan.file(fname, opts)
  end

  @doc """
  Parses xml from a string. See http://www.erlang.org/doc/man/xmerl_scan.html
  for a description of the available options
  """
  @spec from_string(String.t, [{key, value}]) :: {document, rest}
  def from_string(str, opts \\ []) do
    :binary.bin_to_list(str) |> :xmerl_scan.string(opts)
  end

  @doc """
  Tries to guess wether the first argument is a filename or not, and calls the
  appropriate function. See http://www.erlang.org/doc/man/xmerl_scan.html
  for a description of the available options
  """
  @spec parse(String.t, [{key, value}]) :: {document, rest}
  def parse(string_or_fname, opts \\ []) do
    if File.exists?(string_or_fname) do
      from_file(string_or_fname, opts)
    else
      from_string(string_or_fname, opts)
    end
  end
end
