defmodule TodoList do
  @moduledoc """
  Represents the interface for creating, manipulating and querying todo lists in the project.

  We represent a todo list using a map like this:
  ```
  %{~D(2019-03-12) => [\"Walk the dog\", \"Water the plants\"]}
  ```

  Where we use an internal list with the `items` in it associated to a `date` key in the `map`.
  All interactions with this data type should be done through the functions implemented in this module.
  """

  @spec new() :: Map.t()
  @doc """
  Returns a new instance of a todo list, which right now is just an empty map.

  ## Example
  ```
  iex> TodoList.new()
  %{}
  ```
  """
  def new(), do: %{}

  @spec entries(Map.t(), Date.t()) :: List.t()
  @doc """
  Returns the entries for a given date inside the todo list.

  ## Example
  ```
  iex> sample_list = TodoList.new() |> TodoList.add_entry(~D[2018-03-12], \"Walk the dog\")
  iex> TodoList.entries(~D[2018-03-12])
  [\"Walk the dog\"]
  ```
  """
  def entries(todo_list, date) do
    Map.get(todo_list, date)
  end

  @spec add_entry(Map.t(), Date.t(), String.t()) :: Map.t()
  @doc """
  Returns a todo list with the entry added to the given date.
  If the date is already present in the list, the item gets appended to the beginning of the list.
  Otherwise, the date is created in the todo list.

  ## Examples
  ```
  iex> blank_list = TodoList.new()
  iex> list_with_new_entry = TodoList.add_entry(blank_list, ~D[2020-05-24], \"Do homework\")
  %{~D[2020-05-24] => [\"Do homework\"]}
  iex> list_with_another_date = TodoList.add_entry(list_with_new_entry, ~D[2020-05-25], \"Schedule meeting\")
  %{~D[2020-05-24] => [\"Do homework\"], ~D[2020-05-25] => [\"Schedule meeting\"]}
  iex> list_with_another_entry = TodoList.add_entry(list_with_new_entry, ~D[2020-05-24], \"Watch anime\")
  %{~D[2020-05-24] => [\"Do homework\", \"Watch anime\"]}
  ```
  """
  def add_entry(todo_list, date, item) do
    Map.update(todo_list, date, [item], fn titles -> [item | titles] end)
  end
end
