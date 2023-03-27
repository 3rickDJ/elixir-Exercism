defmodule KitchenCalculator do
  def get_volume({_unit, vol}), do: vol

  @conversion %{
    cup: 240.0,
    fluid_ounce: 30.0,
    teaspoon: 5.0,
    tablespoon: 15.0,
    milliliter: 1.0
  }
  def to_milliliter({unit, qty}) do
    {:milliliter, @conversion[unit] * qty}
  end

  def from_milliliter({:milliliter, qty}, unit) do
    {unit, qty / @conversion[unit]}
  end

  def convert(vol_pair, unit) do
    to_milliliter(vol_pair)
    |> from_milliliter(unit)
  end
end
