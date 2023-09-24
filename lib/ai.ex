defmodule AI do
  @moduledoc """
  Documentation for `AI`.
  """

  @doc """
  Implements the ~LLM sigil, which parses text into an OpenAI friendly chat completion prompt.
  ~LLM works by parsing out the `model`, `system`, `user` and `assistant` keywords.

  ## Examples
  iex> import Potions
  iex> ~LLM"model: gpt-3.5-turbo system: You are an expert at text to image prompts. Given a description, write a text-to-image prompt. user: sunset"
  [
    model: "gpt-3.5-turbo",
    messages: [
      %{
        content: "You are an expert at text to image prompts. Given a description, write a text-to-image prompt.",
        role: "system"
      },
      %{content: "sunset", role: "user"}
    ]
  ]
  """

  @keywords "model:|system:|user:|assistant:"

  def sigil_LLM(lines, _opts) do
    lines |> text_to_prompts()
  end

  defp text_to_prompts(text) when is_binary(text) do
    extract_prompts(text)
    |> model_messages()
  end

  defp model_messages([%{content: model_name} | messages]) do
    [model: model_name, messages: messages]
  end

  defp extract_prompts(text) do
    pattern = ~r/(?<key>#{@keywords})\s*(?<value>(?:(?!#{@keywords}).)+)/

    Regex.scan(pattern, text)
    |> Enum.map(&convert_to_map/1)
  end

  defp convert_to_map([_, key, value]) do
    %{role: String.trim(key, ":"), content: String.trim(value)}
  end

  @doc """
  Parses out OpenAI's chat completion response into a cleaner format.
  Returns {:ok, text_content} or {:error, message}

  Instead of:
  {:ok,
  %{
   id: "chatcmpl-7zSc1rsCXpyALMjM9MkaF077xYRot",
   usage: %{
     "completion_tokens" => 10,
     "prompt_tokens" => 19,
     "total_tokens" => 29
   },
   created: 1694882349,
   choices: [
     %{
       "finish_reason" => "stop",
       "index" => 0,
       "message" => %{
         "content" => "Compact and stack snow blocks in a dome shape.",
         "role" => "assistant"
       }
     }
   ],
   model: "gpt-3.5-turbo-0613",
   object: "chat.completion"
  }}
  """
  def chat(text) do
    text
    |> OpenAI.chat_completion()
    |> parse_chat()
  end

  defp parse_chat({:ok, %{choices: [%{"message" => %{"content" => content}} | _]}}),
    do: {:ok, content}

  defp parse_chat({:error, %{"error" => %{"message" => message}}}), do: {:error, message}
end
