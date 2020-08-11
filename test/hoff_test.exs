defmodule HoffTest do
  use ExUnit.Case

  alias Hoff.User

  test "FizzBuzz" do
    assert Hoff.fizzbuzz(15) == [
             1,
             2,
             "Fizz",
             4,
             "Buzz",
             "Fizz",
             7,
             8,
             "Fizz",
             "Buzz",
             11,
             "Fizz",
             13,
             14,
             "FizzBuzz"
           ]
  end

  test "return a reversed string with only even numbers" do
    input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    output = Hoff.reverse_only_even(input)

    assert output == "10-8-6-4-2"
  end

  test "make a chain of possible error functions" do
    input = %{id: 1, name: "Hoff"}

    user = User.cast(input)

    assert {:ok, %User{}} = user
  end
end
