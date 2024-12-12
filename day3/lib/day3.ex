defmodule Day3 do
  @moduledoc """
  Documentation for `Day3`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day3.hello()
      :world

  """

  def solve_2 do
    Regex.scan(~r/(?:^|do\(\))(.*?)(?:$|don't\(\))/s, File.read!("input.txt"))
    |> Enum.map(&List.first/1)
    |> Enum.map(fn match ->
      Regex.scan(~r/mul\((\d{1,3}),(\d{1,3})\)/, match)
      |> Enum.map(fn [_, a, b] -> String.to_integer(a) * String.to_integer(b) end)
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  def solve_1 do
    Regex.scan(~r/mul\((\d{1,3}),(\d{1,3})\)/, File.read!("input.txt"))
    |> Stream.map(fn [_, a, b] -> String.to_integer(a) * String.to_integer(b) end)
    |> Enum.sum()
  end
end
