defmodule AITest do
  use ExUnit.Case
  doctest AI
  import AI

  test "basic usage" do
    assert ~l"model:gpt-3.5-turbo user:how do I build an igloo in 10 words?" ==
             [
               model: "gpt-3.5-turbo",
               messages: [%{role: "user", content: "how do I build an igloo in 10 words?"}]
             ]
  end

  test "code interpolation works" do
    model = "gpt-3.5-turbo"
    assert ~l"model:#{model} user:how do I build an igloo in 10 words?" ==
             [
               model: "gpt-3.5-turbo",
               messages: [%{role: "user", content: "how do I build an igloo in 10 words?"}]
             ]
  end


end
