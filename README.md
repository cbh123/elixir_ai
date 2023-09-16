# AI

Helpers for using AI in Elixir.

Includes `~LLM` sigil and `chat/1` function for OpenAI generation.

```elixir
iex> ~LLM"model:gpt-3.5-turbo user: how do I build an igloo in 10 words?"
[
  model: "gpt-3.5-turbo",
  messages: [%{role: "user", content: "how do I build an igloo in 10 words?"}]
]
```

```elixir
iex> ~LLM"model:gpt-3.5-turbo user: how do I build an igloo in 10 words?" |> chat()
{:ok, "Stack snow blocks in circle, decreasing size upward, till enclosed"}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `potions` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ai, "~> 0.3.1"},
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/potions>.
