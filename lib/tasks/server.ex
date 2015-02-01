defmodule Mix.Tasks.Server do
  use Mix.Task
  @shortdoc "Start application"

  def run(_args) do
    {:ok, _} = Plug.Adapters.Cowboy.http HalloBerlin, [],
      port: port(System.get_env("PORT"))
    no_halt
  end

  defp no_halt do
    unless iex_running?, do: :timer.sleep(:infinity)
  end

  defp iex_running? do
    Code.ensure_loaded?(IEx) && IEx.started?
  end

  defp port(nil), do: 4000
  defp port(value) do
    String.to_integer(value)
  end
end
