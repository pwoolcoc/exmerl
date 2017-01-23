ExUnit.start

defmodule PathHelpers do
  def fixture_path do
    Path.expand("fixtures", __DIR__)
  end

  def fixture_path(extra) do
    Path.join(fixture_path(), extra)
  end
end

defmodule TestHelpers do
  def result do
    result("", [])
  end

  def result(list_or_string) when is_binary(list_or_string) do
    result(list_or_string, [])
  end

  def result(opts) do
    result("", opts)
  end

  def result(suffix, opts) do
    loc = Path.dirname(__DIR__) <> suffix
    loc = if Keyword.get(opts, :char_list, false) do
      to_char_list loc
    else
      loc
    end
    {
      :xmlElement, :root, :root, [], { :xmlNamespace, [], [] }, [], 1, [],
      [
        {:xmlText, [root: 1], 1, [], '\n  ', :text},
        {:xmlElement,
          :"node-one", :"node-one", [],
          {:xmlNamespace, [], []},
          [root: 1], 2, [], [{:xmlText, ["node-one": 2, root: 1], 1, [], 'Some Text', :text}],
          [], loc, :undeclared},
        {:xmlText, [root: 1], 3, [], '\n  ', :text},
        {:xmlElement, :"node-two", :"node-two", [],
          {:xmlNamespace, [], []}, [root: 1], 4,
            [{:xmlAttribute, :name, [], [], [], ["node-two": 4, root: 1], 1, [], 'blah', false}],
            [{:xmlText, ["node-two": 4, root: 1], 1, [], 'HI', :text}],
            [], :undefined, :undeclared},
        {:xmlText, [root: 1], 5, [], '\n  ', :text},
        {:xmlElement, :slfclsng, :slfclsng, [], {:xmlNamespace, [], []}, [root: 1], 6, [], [], [], :undefined, :undeclared},
        {:xmlText, [root: 1], 7, [], '\n  ', :text},
        {:xmlElement, :node, :node, [], {:xmlNamespace, [], []}, [root: 1], 8, [{:xmlAttribute, :wth, [], [], [], [node: 8, root: 1], 1, [], [110, 111, 110, 97, 115, 99, 105, 105, 45, 269, 104, 97, 114, 97, 99, 116, 101, 114, 115], false}], [], [], :undefined, :undeclared},
        {:xmlText, [root: 1], 9, [], '\n', :text}
      ],
      [], loc, :undeclared}
  end
end
