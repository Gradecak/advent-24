defmodule Day2 do
  @moduledoc """
  Documentation for `Day2`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day2.hello()
      :world

  """
  def dampened_levels(level) do
    (0..length(level))
    |> Enum.map(fn idx -> List.delete_at(level, idx) end)
  end

  def level_safe?(level) do
    diffs = Enum.zip(level, tl(level)) |> Enum.map(fn {a, b} -> a - b end)
    Enum.all?(diffs, &(&1 > -4 && &1 < 0)) || Enum.all?(diffs, &(&1 < 4 && &1 > 0))
  end

  def solve_2 do
    File.stream!("input.txt")
    |> Enum.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)
      |> dampened_levels
      |> Enum.map(&level_safe?/1)
      |> Enum.any?
    end)
    |> Enum.filter(&(&1 && true))
    |> length
  end

  def solve_1 do
    File.stream!("input.txt")
    |> Stream.map(fn line ->
      String.split(line)
      |> Enum.map(&String.to_integer/1)
      |> level_safe?
    end)
    |> Enum.filter(&(&1 && true))
    |> length
  end
end
