defmodule AdventOfCode.Day01.Part1 do
  def solution(input) do
    input
    |> Kino.Input.read()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [left, right] -> right > left end)
  end
end
