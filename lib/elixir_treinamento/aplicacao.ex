defmodule ElixirTreinamento.Application do
  use Application

  def start(_type, _args) do
    children = [
      # This is the new line
      ElixirTreinamento.ServidorAleatorio,
      ElixirTreinamento.Agendador
    ]

    opts = [strategy: :one_for_one, name: ElixirTreinamento.Supervisor]
    Supervisor.start_link(children, opts)
  end
end