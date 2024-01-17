defmodule Tutorials do
  @moduledoc """
  Documentation for `Tutorials`.
  """
alias Tutorials.RomanNumerals.GetRomanNumerals
alias Tutorials.ListImpl.Index, as: ListImpl

  @doc """
  Change an integer number less than 1000 to roman numeral.

  ## Examples
      iex> alias Tutorials.RomanNumerals.GetRomanNumerals
      iex> GetRomanNumerals.convert_number_to_roman_numeral(457)
      "CDLVII"

  """
  defdelegate convert_number_to_roman_numeral(num), to: GetRomanNumerals

  #=========================================================================

  @doc """
  Concats two arrays

  ## Examples
      iex> alias Tutorials.ListImpl.Index, as: ListImpl
      iex> ListImpl.concat([1,2,3], [4, 5, 6])
      [1,2,3,4,5,6]

  """
  defdelegate concat(src, dest), to: ListImpl
end
