defmodule LogLevel do
  def to_label(level, legacy?) do
    log_label = %{
      0 => %{legacy: false, log: :trace},
      1 => %{legacy: true, log: :debug},
      2 => %{legacy: true, log: :info},
      3 => %{legacy: true, log: :warning},
      4 => %{legacy: true, log: :error},
      5 => %{legacy: false, log: :fatal}
    }

    Map.get(log_label, level)
    |> case do
      %{legacy: true, log: msg} -> msg
      %{legacy: ^legacy?, log: msg} -> msg
      _ -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    {to_label(level, legacy?), legacy?}
    |> case do
      {:error, _} -> :ops
      {:fatal, _} -> :ops
      {:unknown, true} -> :dev1
      {:unknown, false} -> :dev2
      _ -> false
    end
  end
end
