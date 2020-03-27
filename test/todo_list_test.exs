defmodule TodoListTest do
  use ExUnit.Case

  describe "new/0" do
    test "creates a new todo list" do
      assert %{} = TodoList.new()
    end
  end

  describe "entries/2" do
    test "displays the entries in a todo list given a target date" do
      desired_date = ~D[2020-03-12]
      sample_list = Map.put(%{}, desired_date, ["Walk the dog", "Water the plants"])

      assert ["Walk the dog", "Water the plants"] = TodoList.entries(sample_list, desired_date)
    end
  end
end
