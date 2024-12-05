defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day1.hello()
      :world

  """

  def solve_1 do
    File.stream!("input.txt")
    |> Stream.map(fn l -> String.split(l) |> Enum.map(&String.to_integer/1) end)
    |> Stream.zip()
    |> Stream.map(&Tuple.to_list/1)
    |> Stream.map(&Enum.sort/1)
    |> Stream.zip_with(fn [a, b] -> Kernel.abs(a - b) end)
    |> Enum.sum()
  end

  def solve_2 do
    [input, freq_list] =
      File.stream!("input.txt")
      |> Stream.map(fn l -> String.split(l) |> Enum.map(&String.to_integer/1) end)
      |> Stream.zip()
      |> Enum.map(&Tuple.to_list/1)

    frequencies = Enum.frequencies(freq_list)

    input
    |> Stream.map(fn source -> source * Map.get(frequencies, source, 0) end)
    |> Enum.sum()
  end
end
