defmodule Hoff do
  @moduledoc false

  def fizzbuzz(length), do: Enum.map(1..length, &replace_by_fizz_or_buzz/1)

  defp replace_by_fizz_or_buzz(number) when rem(number, 15) == 0, do: "FizzBuzz"
  defp replace_by_fizz_or_buzz(number) when rem(number, 3) == 0, do: "Fizz"
  defp replace_by_fizz_or_buzz(number) when rem(number, 5) == 0, do: "Buzz"
  defp replace_by_fizz_or_buzz(number), do: number
end
