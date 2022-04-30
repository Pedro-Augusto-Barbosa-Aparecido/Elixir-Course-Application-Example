use Mix.Config

config :elixir_treinamento, ElixirTreinamento.Agendador, jobs: [
                                               {"* * * * *", fn -> GenServer.cast(:servidor_aleatorio, :escreve) end}
]