defmodule Exmerl.XPath do
  @moduledoc ~s"""
  Select xml elements by an XPath selector

  Currently only provides one function, `find/2,3,5`
  """

  @typedoc "xml document"
  @type document :: term

  @typedoc "Rest"
  @type rest :: [term]

  @typedoc "xml element"
  @type element :: term

  @typedoc "key for option list"
  @type key :: atom

  @typedoc "value for option list"
  @type value :: term

  @typedoc "xpath string"
  @type xpath_string :: String.t

  @typedoc "xpath result"
  @type xpath_result :: term

  @doc """
  Select one or more XML elements using an XPath expression

  An alternate form of this allows `{document, rest}` to be passed in
  as the first parameter, and returns it along with the xpath result,
  for easy piping from Exmerl.parse calls.

  Example:

      iex(1)> Exmerl.parse("my_xml_file.xml") |> Exmerl.XPath.find("//somenode")
      {
        # this is the actual result from the .find call
        [ ... ],
        # this is the `rest` result from the .parse call
        [ ... ]
      }
      iex(2)> 
  """
  @spec find(document, xpath_string, [{key, value}]) :: xpath_result
  def find(doc, str, opts \\ [])

  @spec find({document, rest}, xpath_string, [{key, value}]) :: {xpath_result, rest}
  def find({doc, rest}, str, opts) do
    {:xmerl_xpath.string(to_char_list(str), doc, opts), rest}
  end

  def find(doc, str, opts) do
    :xmerl_xpath.string(to_char_list(str), doc, opts)
  end

  @doc ~s"""
  Same as http://www.erlang.org/doc/man/xmerl_xpath.html#string-5,
  except for rearranging of the function parameters to allow piping.
  """
  def find(doc, str, node, parents, opts \\ [])

  def find({doc, rest}, str, node, parents, opts) do
    {:xmerl_xpath.string(to_char_list(str), node, parents, doc, opts), rest}
  end

  def find(doc, str, node, parents, opts) do
    :xmerl_xpath.string(to_char_list(str), node, parents, doc, opts)
  end

end
