# AI

Helpers for using AI in Elixir. Currently requires the [OpenAI](https://github.com/mgallo/openai.ex) package.

Includes `~l` sigil and `chat/1` function for OpenAI generation.

```elixir
iex> ~l"model:gpt-3.5-turbo user: how do I build an igloo in 10 words?"
[
  model: "gpt-3.5-turbo",
  messages: [%{role: "user", content: "how do I build an igloo in 10 words?"}]
]
```

```elixir
iex> ~l"model:gpt-3.5-turbo user: how do I build an igloo in 10 words?" |> chat()
{:ok, "Stack snow blocks in circle, decreasing size upward, till enclosed"}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed by adding `ai` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ai, "~> 0.3.4"},
  ]
end
```

## Why?

[Here's why!](https://www.charlieholtz.com/articles/elixir-ai)
