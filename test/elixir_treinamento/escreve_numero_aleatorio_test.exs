defmodule ElixirTreinamentoTest.EscreveNumeroAleatorioTest do
  use ExUnit.Case
  import Mock
  test "2 escritas gera números diferentes" do
    ElixirTreinamento.EscreveNumeroAleatorio.escreve

    primeiro_conteudo = File.read!(Path.join([
      :code.priv_dir(:elixir_treinamento),
      "arquivo.txt"
    ]))

    ElixirTreinamento.EscreveNumeroAleatorio.escreve

    segundo_conteudo = File.read!(Path.join([
      :code.priv_dir(:elixir_treinamento),
      "arquivo.txt"
    ]))

    assert primeiro_conteudo != segundo_conteudo

  end

  test "com mock" do
    :ets.new(:conteudo, [:set, :private, :named_table])
    with_mock File, [write!: fn (_path, conteudo) -> :ets.insert_new(:conteudo, {conteudo}) end] do
      ElixirTreinamento.EscreveNumeroAleatorio.escreve
      ElixirTreinamento.EscreveNumeroAleatorio.escreve
    end

    conteudos = :ets.tab2list(:conteudo)
    [primeiro_valor | conteudos] = conteudos
    [segundo_valor | _] = conteudos

    assert primeiro_valor != segundo_valor

  end

end