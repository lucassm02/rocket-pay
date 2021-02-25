defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with the given name , returns the sum of numbers" do
      result = Numbers.sum_from_file("numbers")

      expected = {:ok, %{result: 37}}

      assert result == expected
    end

    test "when there is not file with the given name, returns an error" do
      result = Numbers.sum_from_file("invalid_name")

      expected = {:error, %{message: "Invalid filename!"}}

      assert result == expected
    end
  end
end
