:- include('PesquisaLigacaoVisitaLista.pl').

% todos_trajetos(Initial, Lista, Solucoes) -> armazena em Solucoes todos os trajetos possíveis que se iniciam no nó Initial e que passam por todos os nós em Lista, pela respetiva ordem
todos_trajetos(Initial, Lista, Solucoes) :-
    findall(Solucao, resolva_prof_todos(Initial, Lista, Solucao), Solucoes).