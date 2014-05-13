defmodule Exml.XPath do
  def find(doc, str, opts \\ [])

  def find({doc, rest}, str, opts) do
    IO.puts "find/3"
    {:xmerl_xpath.string(to_char_list(str), doc, opts), rest}
  end

  def find(doc, str, opts) do
    IO.puts "find/3"
    :xmerl_xpath.string(to_char_list(str), doc, opts)
  end

  def find(doc, str, node, parents, opts \\ [])

  def find({doc, rest}, str, node, parents, opts) do
    IO.puts "find/5"
    {:xmerl_xpath.string(to_char_list(str), node, parents, doc, opts), rest}
  end

  def find(doc, str, node, parents, opts) do
    :xmerl_xpath.string(to_char_list(str), node, parents, doc, opts)
  end

end
