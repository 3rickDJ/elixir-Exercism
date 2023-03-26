defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove([_head | list]), do: list

  def first([head | _list]), do: head

  def count(list), do: counter(list, 0)

  defp counter([_head | tail], counter), do: counter(tail, counter + 1)

  defp counter([], counter), do: counter

  def functional_list?(list), do: "Elixir" in list
end
