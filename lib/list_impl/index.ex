defmodule Tutorials.ListImpl.Index do
  @moduledoc """
  Documentation for `Tutorials.ListImpl.Index`.
  Contains my implementation of popular Elixir list methods
  """

  @spec concat([any()], [any()]) :: [any()]
  @doc """
  Concatenate or join two lists.

  ## Examples

      iex> Tutorials.ListImpl.Index.concat([1,2,3,4], [5, 6, 7, 8])
      [1,2,3,4,5,6,7,8]

  """
  def concat(src, dest), do: concat_func(src |> Enum.reverse, dest)
  defp concat_func([], dest), do: dest
  defp concat_func([h | t], dest) do
    concat_func(t, [h | dest])
  end

  @spec reverse([any()]) :: [any()]
  @doc """
  Reverses the content of a list.

  ## Examples

      iex> Tutorials.ListImpl.Index.reverse([1,2,3,4])
      [4,3,2,1]

  """
  def reverse(list, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc) do
    reverse(t, [h | acc])
  end

  defp map_func(list, _func, acc \\ [])
  defp map_func([], _func, acc), do: acc
  defp map_func([h | t], func, acc) do
    map_func(t, func, [func.(h) | acc])
  end


  @spec map([any()], (any() -> any())) :: [any()]
  @doc """
  runs the function on each element of a list and returns the value of each in a list.

  ## Examples

      iex> Tutorials.ListImpl.Index.map([1,2,3,4], fn x -> x*x end)
      [1,4,9,16]

  """
  def map(list, func), do: map_func(list, func) |> reverse

  def sum(nums, acc \\ 0)
  def sum([], acc), do: acc
  @spec sum([number()]) :: number()
  @doc """
  runs the function on each element of a list and returns the value of each in a list.

  ## Examples

      iex> Tutorials.ListImpl.Index.sum([1,2,3,4])
      10

  """
  def sum([h | t], acc) do
    sum(t, acc + h)
  end
end
alias Tutorials.ListImpl.Index

IO.puts(Index.sum([1,2,3,4]))
