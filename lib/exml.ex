defmodule Exml do
  def file(fname, _opts \\ []) do
    :xmerl_scan.file(fname)
  end

  def string(str, _opts \\ []) do
    :xmerl_scan.string(to_char_list str)
  end

  def parse(string_or_io, opts \\ []) do
    if File.exists?(string_or_io) do
      file(string_or_io, opts)
    else
      string(string_or_io, opts)
    end
  end

  def parse!(string_or_io, opts \\ []) do
    {doc, _} = parse(string_or_io, opts)
    doc
  end
end
