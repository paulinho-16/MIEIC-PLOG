:- use_module(library(clpfd)).

nome(1, 'Carlos').
nome(2, 'Ricardo').
nome(3, 'Raul').
nome(4, 'Tomas').
nome(5, 'Roberto').
nome(6, 'Boris').
nome(7, 'Diego').
nome(8, 'Luis').

% torneio_ciclismo -> resolve o problema do torneio de ciclismo, com base nas informações dadas
torneio_ciclismo :-
    Corredores = [Carlos, Ricardo, Raul, Tomas, Roberto, Boris, Diego, Luis],
    domain(Corredores, 1, 8),
    all_distinct(Corredores),
    Boris #\= 7,
    Tomas #=< 4,
    Raul #\= 4, Tomas #\= 4,
    Diego #\= 7, Diego #\= 8, Boris #\= 7, Boris #\= 8,
    Roberto #\= 5,
    Raul #\= 5,
    Carlos in (1..2), Luis in (1..2),
    Luis #\= 7, Ricardo #\= 7, Boris #\= 7,
    Luis #\= 3, Ricardo #\= 3, Boris #\= 3,
    Luis #\= 1, Ricardo #\= 1, Boris #\= 1,
    Luis #\= 4, Ricardo #\= 4, Boris #\= 4,
    Luis #\= 5, Ricardo #\= 5, Boris #\= 5,
    labeling([], Corredores),
    escrever(Corredores, 1).

escrever([], _).
escrever([Corredor|Corredores], N) :-
    nome(N, NomeCorredor),
    write(NomeCorredor), write(' ficou em '), write(Corredor), nl,
    N1 is N + 1,
    escrever(Corredores, N1).