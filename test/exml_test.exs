defmodule ExmlTest do
  use ExUnit.Case
  import PathHelpers
  import TestHelpers

  test "parse basic file" do
    {document, _} = Exml.parse(fixture_path("justroot.xml"))
    assert document == {:xmlElement, :rootnode, :rootnode, [], {:xmlNamespace, [], []}, [], 1, [],
        [{:xmlText, [rootnode: 1], 1, [], '\n', :text}],
        [],
        "/home/paul/Code/exml/test/fixtures", :undeclared}
  end

  test "parse file" do
    {document, _} = Exml.file(fixture_path("test.xml"))
    assert document == result("/test/fixtures")
  end

  test "parse string" do
    doc = File.read!(fixture_path("test.xml"))
    {document, _} = Exml.string(doc)
    assert document == result("", char_list: true)
  end

  test "parse method given filename" do
    {document, _} = Exml.parse(fixture_path("test.xml"))
    assert document == result("/test/fixtures")

    document = Exml.parse!(fixture_path("test.xml"))
    assert document == result("/test/fixtures")
  end

  test "parse method given string" do
    doc = File.read!(fixture_path("test.xml"))
    {document, _} = Exml.parse(doc)
    assert document == result("", char_list: true)

    document = Exml.parse!(doc)
    assert document == result("", char_list: true)
  end
end
