defmodule AdventOfCode.Day01.Part2 do
  def solution(input) do
    input
    |> Kino.Input.read()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [left_window, right_window] ->
      Enum.sum(right_window) > Enum.sum(left_window)
    end)
  end
end
