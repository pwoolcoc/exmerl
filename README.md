# Exmerl

A wrapper for the xmerl\_\* suite of modules, though at the moment all
you can do is parse and use xpaths to select nodes.

## Usage

Currently it is possible to parse XML from a file or string using either `from_file/1,2`,
`from_string/1,2` or `parse/1,2`. They all accept an optional Keyword
list as the second argument. Possible options can be found in the erlang
documentation for the xmerl\_\* modules.

    iex(1)> # you can pass parse/1,2 a filename or an xml string
    iex(2)> Exmerl.parse("test.xml")
    {{:xmlElement, :root, :root, [], {:xmlNamespace,...
    ...
    ...
    iex(3)> {doc, rest} = Exmerl.from_string("""<?xml version="1.0" encoding="utf-8" ?><rootnode>Test</rootnode>""")
    {{:xmlElement, :root, :root, [], {:xmlNamespace,...
    ...
    ...

You can traverse the document by using xpath selectors, and the
Exmerl.XPath.find function. `find/2,3,4,5` takes an XML document (or a
`{doc, rest}` pair as shown above), an xpath selector, and optional
`node`, `parent`, and a Keyword list of options. `find` will accept a
`{doc,rest}` pair to make it easier to pipe the output of `parse` into
`find`:

    iex(1)> Exmerl.parse("test.xml") |>
    ...(1)>   Exmerl.XPath.find("//some-node-name")
    {[{:xmlElement, ...
    ...
    ...

In this case, instead of returning `[result_term]`, it will return
`{[result_term], [rest]}`.
