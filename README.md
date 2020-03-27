# ElixirTodoList

This is a cookie-cutter TODO list application. I know, todo lists are old and
overused projects for learning, but Elixir In Action uses it and walks us
through the architecture. This is why I'm replicating the code here.

As quoted from the book:

> The problem is admittedly not spectacular, but it's complex enough to give you
> something to work on while not being overly complicated. This will allow you
> to focus on techniques without spending too much time trying to grasp the
> problem itself.

## Desired usage

``` shell
$ iex simple_todo.example
iex(1) > todo_list =
           TodoList.new() |>
           TodoList.add_entry(~D[2018-12-19], "Dentist") |>
           TodoList.add_entry(~D[2018-12-20], "Shopping") |>
           TodoList.add_entry(~D[2018-12-19], "Movies")
iex(2) > TodoList.entries(todo_list, ~DO[2018-12-19])
["Movies", "Dentist"]

iex(3) > TodoList.entries(todo_list, ~D[2018-12-18])
[]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_todo_list` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_todo_list, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_todo_list](https://hexdocs.pm/elixir_todo_list).
