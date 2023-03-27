defmodule KitchenCalculator do
  def get_volume({:cup, vol}), do: vol

  @conversion %{
    cup: 240.0,
    fluid_ounce: 30.0,
    teaspoon: 5.0,
    tablespoon: 15.0,
    milimiter: 1.0
  }
  def to_milimiter({unit, qty}) do
    @conversion[unit] * qty
  end

  def to_milliliter({:cup, qty}), do: {:milimiter, qty * 240.0}
  def to_milliliter({:fluid_ounce, qty}), do: qty * 30.0
  def to_milliliter({:teaspoon, qty}), do: qty * 5.0
  def to_milliliter({:tablespoon, qty}), do: qty * 15.0
  def to_milliliter({:milliliter, qty}), do: qty * 1.0

  def from_milliliter(volume_pair, :cup), do: to_milliliter(volume_pair) / 240.0
  def from_milliliter(volume_pair, :fluid_ounce), do: to_milliliter(volume_pair) / 30.0
  def from_milliliter(volume_pair, :teaspoon), do: to_milliliter(volume_pair) / 5.0
  def from_milliliter(volume_pair, :tablespoon), do: to_milliliter(volume_pair) / 15.0
  def from_milliliter(volume_pair, :milimiter), do: to_milliliter(volume_pair) / 1.0

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
  end
end
