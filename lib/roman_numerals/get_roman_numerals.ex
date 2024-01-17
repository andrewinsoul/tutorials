defmodule Tutorials.RomanNumerals.GetRomanNumerals do
  # @dict %{
  #   1000 => "M",
  #   100 => "C",
  #   50 => "L",
  #   40 => "XL",
  #   400 => "CD",
  #   10 => "X",
  #   5 => "V",
  #   1 => "I"
  # }

  @spec convert_number_to_roman_numeral(number()) :: String.t()
  def convert_number_to_roman_numeral(num, acc \\ "")

  def convert_number_to_roman_numeral(num, acc) when num < 10 do
    cond do
      num >= 1 and num < 4 -> acc <> String.duplicate("I", num)
      num == 5 -> acc <> "V"
      num > 5 and num < 9 -> acc <> "V" <> String.duplicate("I", num - 5)
      num == 9 -> acc <> "IX"
      num == 4 -> acc <> "IV"
      true -> acc <> ""
    end
  end

  def convert_number_to_roman_numeral(num, acc) when num >= 1000 do
    convert_number_to_roman_numeral(
      rem(num, 1000),
      acc <> String.duplicate("M", div(num, 1000))
    )
  end

  def convert_number_to_roman_numeral(num, acc) when num < 1000 and num >= 100 do
    cond do
      div(num, 100) >= 1 and div(num, 100) < 4 ->
        convert_number_to_roman_numeral(
          rem(num, 100),
          acc <> String.duplicate("C", div(num, 100))
        )

      div(num, 100) == 5 ->
        convert_number_to_roman_numeral(rem(num, 100), acc <> "D")

      div(num, 100) > 5 and div(num, 100) < 9 ->
        convert_number_to_roman_numeral(
          rem(num, 100),
          acc <> "D" <> String.duplicate("C", div(num, 100) - 5)
        )

      div(num, 100) == 9 ->
        convert_number_to_roman_numeral(rem(num, 100), acc <> "CM")

      true ->
        convert_number_to_roman_numeral(rem(num, 100), acc <> "CD")
    end
  end

  def convert_number_to_roman_numeral(num, acc) when num < 100 do
    cond do
      div(num, 10) >= 1 and div(num, 10) < 4 ->
        convert_number_to_roman_numeral(
          rem(num, 10),
          acc <> String.duplicate("X", div(num, 10))
        )

      div(num, 10) == 5 ->
        convert_number_to_roman_numeral(rem(num, 10), acc <> "L")

      div(num, 10) > 5 and div(num, 10) < 9 ->
        convert_number_to_roman_numeral(
          rem(num, 10),
          acc <> "L" <> String.duplicate("X", div(num, 10) - 5)
        )

      div(num, 10) == 9 ->
        convert_number_to_roman_numeral(rem(num, 10), acc <> "XC")

      true ->
        convert_number_to_roman_numeral(rem(num, 10), acc <> "XL")
    end
  end
end
