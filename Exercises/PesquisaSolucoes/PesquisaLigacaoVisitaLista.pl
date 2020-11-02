:- include('PesquisaLigacaoGrafo.pl').
:- include('../UtilizacaoListas/SubstituicaoEliminacao.pl').

% resolva_prof_todos(Initial, Lista, Solucao) -> Encontra um caminho entre dois nós do grafo, começando em Initial, que visita todos os nós contidos na lista Lista, pela respetiva ordem, armazenando o resultado em Solucao
resolva_prof_todos(_, [], []).
resolva_prof_todos(Initial, [H|Lista], Solucao) :-
    resolva_prof(Initial, H, Caminho),
    resolva_prof_todos(H, Lista, RestoSolucao),
    append(Caminho, RestoSolucao, NovaSolucao),
    elimina_duplicados(NovaSolucao, Solucao).