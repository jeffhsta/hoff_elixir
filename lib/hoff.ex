defmodule Hoff do
  @moduledoc false

  def fizzbuzz(length), do: Enum.map(1..length, &replace_by_fizz_or_buzz/1)

  defp replace_by_fizz_or_buzz(number) when rem(number, 15) == 0, do: "FizzBuzz"
  defp replace_by_fizz_or_buzz(number) when rem(number, 3) == 0, do: "Fizz"
  defp replace_by_fizz_or_buzz(number) when rem(number, 5) == 0, do: "Buzz"
  defp replace_by_fizz_or_buzz(number), do: number

  def reverse_only_even(number_list) do
    number_list
    |> Enum.filter(&(rem(&1, 2) == 0))
    |> Enum.reverse()
    |> Enum.join("-")
  end
end

defmodule Hoff.User do
  @moduledoc false

  defstruct [:id, :name]

  def cast(%{id: id, name: name}) do
    with :ok <- validate_id_type(id),
         :ok <- validate_name_type(name),
         :ok <- validate_name_length(name) do
      {:ok, %__MODULE__{id: id, name: name}}
    end
  end

  defp validate_id_type(id) when is_number(id), do: :ok
  defp validate_id_type(_), do: {:error, :id_is_not_a_number}

  defp validate_name_type(name) when is_bitstring(name), do: :ok
  defp validate_name_type(_), do: {:error, :name_is_not_a_string}

  defp validate_name_length(name) do
    case String.length(name) > 3 do
      true -> :ok
      false -> {:error, :name_has_length_lower_than_expected}
    end
  end
end
