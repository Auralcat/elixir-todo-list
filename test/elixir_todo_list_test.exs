defmodule ElixirTodoListTest do
  use ExUnit.Case
  doctest ElixirTodoList

  test "greets the world" do
    assert ElixirTodoList.hello() == :world
  end
end
