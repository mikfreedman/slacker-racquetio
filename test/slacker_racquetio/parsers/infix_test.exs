defmodule SlackerRacquetio.Parsers.InfixTest do
  use ExUnit.Case

  test "#try_parse parses out echo command" do
    assert SlackerRacquetio.Parsers.Infix.try_parse("lhs command rhs") == {:command, "command", "lhs", "rhs" }
  end

  test "#try_parse supports commands with hyphens" do
    assert SlackerRacquetio.Parsers.Infix.try_parse("lhs foo-command rhs") == {:command, "foo-command", "lhs", "rhs" }
  end

  test "#try_parse returns nil for invalid command" do
    assert SlackerRacquetio.Parsers.Infix.try_parse("") == nil
  end
end

