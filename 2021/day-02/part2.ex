defmodule AdventOfCode.Day02.Part2 do
  def solution(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(%{aim: 0, depth: 0, horizontal_position: 0}, &handle_command/2)
    |> (fn measurements -> measurements.depth * measurements.horizontal_position end).()
  end

  defp handle_command("up " <> steps, acc),
    do: Map.put(acc, :aim, Map.get(acc, :aim, 0) - String.to_integer(steps))

  defp handle_command("down " <> steps, acc),
    do: Map.put(acc, :aim, Map.get(acc, :aim, 0) + String.to_integer(steps))

  defp handle_command("forward " <> steps, acc) do
    with steps <- String.to_integer(steps) do
      acc
      |> Map.put(:depth, Map.get(acc, :depth, 0) + Map.get(acc, :aim, 0) * steps)
      |> Map.put(:horizontal_position, Map.get(acc, :horizontal_position, 0) + steps)
    end
  end
end
