defmodule ExmerlTest do
  use ExUnit.Case
  import PathHelpers
  import TestHelpers

  test "parse basic file" do
    resultpath = to_char_list(Path.dirname __DIR__)
    {document, _} = Exmerl.parse(File.read!(fixture_path("justroot.xml")))
    assert document == {:xmlElement, :rootnode, :rootnode, [], {:xmlNamespace, [], []}, [], 1, [],
        [{:xmlText, [rootnode: 1], 1, [], '\n', :text}],
        [],
        resultpath, :undeclared}
  end

  test "parse file" do
    {document, _} = Exmerl.from_file(fixture_path("test.xml"))
    assert document == result("/test/fixtures")
  end

  test "parse string" do
    doc = File.read!(fixture_path("test.xml"))
    {document, _} = Exmerl.from_string(doc)
    assert document == result("", char_list: true)
  end

  test "parse method given filename" do
    {document, _} = Exmerl.parse(fixture_path("test.xml"))
    assert document == result("/test/fixtures")
  end

  test "parse method given string" do
    doc = File.read!(fixture_path("test.xml"))
    {document, _} = Exmerl.parse(doc)
    assert document == result("", char_list: true)
  end

  test "non-ASCII characters" do
    doc = "<?xml version=\"1.0\" encoding=\"utf-8\"?><rootnode><childnode with=\"non-ascii-čharacters\"></childnode></rootnode>"
    {document, _} = Exmerl.from_string(doc)
    assert elem(document, 0) == :xmlElement
  end
end
