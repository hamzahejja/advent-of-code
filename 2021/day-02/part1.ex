defmodule AdventOfCode.Day02.Part1 do
  def solution(input) do
    input
    |> Kino.Input.read()
    |> String.split("\n", trim: true)
    |> Enum.reduce(%{depth: 0, horizontal_position: 0}, fn
      "up " <> steps, acc ->
        Map.put(acc, :depth, acc.depth - String.to_integer(steps))

      "down " <> steps, acc ->
        Map.put(acc, :depth, acc.depth + String.to_integer(steps))

      "forward " <> steps, acc ->
        Map.put(acc, :horizontal_position, acc.horizontal_position + String.to_integer(steps))
    end)
    |> (fn measurements -> measurements.depth * measurements.horizontal_position end).()
  end
end
