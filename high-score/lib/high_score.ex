defmodule HighScore do
  @default_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @default_score), do: Map.put_new(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: scores |> Map.put(name, @default_score)

  def update_score(scores, name, score) do
    scores
    |> Map.update(name, score, fn current_val -> current_val + score end)
  end

  def get_players(scores), do: scores |> Map.keys()
end
