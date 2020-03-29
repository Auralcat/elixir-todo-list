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

  describe "add_entry/2" do
    test "returns a todo list with a new entry in the given date" do
      desired_entry = %{date: ~D[2020-03-12], title: "Watch anime"}
      sample_list = Map.put(%{}, ~D[2020-03-12], ["Walk the dog", "Water the plants"])

      assert %{
               ~D[2020-03-12] => ["Watch anime", "Walk the dog", "Water the plants"]
             } = TodoList.add_entry(sample_list, desired_entry)
    end

    test "returns a todo list with a new entry in a new date" do
      desired_entry = %{date: ~D[2020-03-12], title: "Watch anime"}
      sample_date = ~D[2020-03-15]
      sample_list = Map.put(%{}, sample_date, ["Walk the dog", "Water the plants"])

      assert %{
               ~D[2020-03-12] => ["Watch anime"],
               ~D[2020-03-15] => ["Walk the dog", "Water the plants"]
             } = TodoList.add_entry(sample_list, desired_entry)
    end

    test "raises an error if the entry does not have a title or a date" do
      sample_date = ~D[2020-03-15]
      sample_list = Map.put(%{}, sample_date, ["Walk the dog", "Water the plants"])

      assert_raise FunctionClauseError, fn ->
        TodoList.add_entry(sample_list, %{})
      end

      assert_raise FunctionClauseError, fn ->
        TodoList.add_entry(sample_list, %{title: "No date"})
      end

      assert_raise FunctionClauseError, fn ->
        TodoList.add_entry(sample_list, %{date: ~D[1989-09-12]})
      end
    end
  end
end
