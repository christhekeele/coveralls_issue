defmodule CoverallsIssueTest do
  use ExUnit.Case
  doctest CoverallsIssue

  test "greets the world" do
    assert CoverallsIssue.hello() == :world
  end
end
