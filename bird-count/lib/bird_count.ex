defmodule BirdCount do
  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?(list) do
    _has_day_without_birds?(list, false)
  end

  defp _has_day_without_birds?(_, true), do: true
  defp _has_day_without_birds?([], birds), do: birds

  defp _has_day_without_birds?([head | tail], birds),
    do: _has_day_without_birds?(tail, birds or head == 0)

  def total(list) do
    _total(list, 0)
  end

  defp _total([], ctr), do: ctr

  defp _total([head | tail], ctr) do
    _total(tail, ctr + head)
  end

  def busy_days(list) do
    _busy_days(list, 0)
  end

  defp _busy_days([head | tail], ctr) when head < 5, do: _busy_days(tail, ctr)
  defp _busy_days([], ctr), do: ctr
  defp _busy_days([_head | tail], ctr), do: _busy_days(tail, ctr + 1)
end
