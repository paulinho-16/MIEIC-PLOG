:- use_module(library(clpfd)).

nome(1, 'Ferreira').
nome(2, 'Rocha').
nome(3, 'Silva').

flatten([], []).
flatten([H | T], FlatBoard):-
    flatten(T, NewFlat),
    append(H, NewFlat, FlatBoard).

% maquinista -> resolve o problema, escrevendo o nome do Maquinista, deduzido com base nas informações dadas
maquinista :-
    Total = [Tarefas, Nomes, Passageiros, Cidades],
    Tarefas = [Revisor, Foguista, Maquinista],
    Nomes = [1, 2, 3],
    Passageiros = [SrFerreira, SrRocha, _SrSilva],
    Cidades = [Detroit, Chicago, DetroitChicago],
    flatten(Total, Flat),
    domain(Flat, 1, 3),
    all_distinct(Tarefas),
    all_distinct(Nomes),
    all_distinct(Passageiros),
    all_distinct(Cidades),
    SrRocha #= Detroit,
    Revisor #= DetroitChicago,
    % Sr Ferreira ganha 10000 por ano (833 por mês) - se fosse o tal vizinho do Revisor, então o Revisor ganharia 277 por mês, o que é inferior ao salário mínimo dos Estados Unidos
    % Por este motivo, o Sr Ferreira não pode ser o vizinho do Revisor, pelo que resta apenas o Sr Silva para o ser
    SrFerreira #\= DetroitChicago,
    Foguista #\= 3,
    member(NomePasg, Passageiros), NomePasg #= Chicago, element(N, Passageiros, NomePasg), element(N, Nomes, Revisor),
    labeling([], Flat),
    nome(Maquinista, Nome),
    write('O Maquinista chama-se '), write(Nome), nl.