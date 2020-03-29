defmodule MultiDict do
  @moduledoc """
  Represents an abstraction over the `Map` operations inside the `TodoList`
  module.

  This abstraction should be used when the codebase gets bigger than a single
  module or so. This module is here more as a demonstration of how we can
  abstract implementation details in Elixir rather than a way to reduce code
  complexity and improve the understanding of how things work as well as
  extensibility.

  I don't know if Elixir has any concept of internal modules, but this would be
  a good use case for this abstraction. Again, this kind of abstraction should
  be used with a good reason and wisely.
  """

  @doc """
  Adds an item to the top of the `list` in a given `key` for the
  given `dictionary (Map)`.

  ## Example
  ```
     iex> new_dict = %{}
     iex> MultiDict.add(new_dict, :rabbit, \"Foot\")
     %{rabbit: [\"Foot\"]}
  ```
  """
  def add(dict, key, value) do
    Map.update(dict, key, [value], &[value | &1])
  end

  @doc """
  Returns an `item` from the `dictionary (Map)`.
  The goal here is to reduce the arity of the `Map.get/3` function from 3
  arguments to 2.

  ## Example
  ```
     iex> previous_dict = %{rabbit: [\"Foot\"]}
     iex> MultiDict.get(previous_dict, :rabbit)
     [\"Foot\"]
  ```
  """
  def get(dict, key) do
    Map.get(dict, key, [])
  end
end
