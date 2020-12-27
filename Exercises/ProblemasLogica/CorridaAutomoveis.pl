:- use_module(library(clpfd)).

nome(1, 'Alemao').
nome(2, 'Ingles').
nome(3, 'Brasileiro').
nome(4, 'Espanhol').
nome(5, 'Italiano').
nome(6, 'Frances').

marca(1, _, 'La Vie Claire').
marca(2, _, 'Sistema-V').
marca(3, _, 'Fagor').
marca(0, 1, 'La Vie Claire').
marca(0, 5, 'Sistema-V').
marca(0, 3, 'Fagor').

corresponder(1, 1).
corresponder(3, 2).
corresponder(4, 3).
corresponder(_, 0).

% corrida -> resolve o problema da corrida de automóveis, com base na informação dada
corrida :-
    Corredores = [Alemao, _Ingles, Brasileiro, Espanhol, Italiano, Frances],
    domain(Corredores, 1, 6),
    all_distinct(Corredores),
    Alemao #\= 1, Alemao #\= 5, Alemao #\= 3,
    Brasileiro #\= 1, Brasileiro #\= 5, Brasileiro #\= 3,
    Espanhol #\= 1, Espanhol #\= 5, Espanhol #\= 3,
    Espanhol #\= 2, Espanhol #\= 6,
    Italiano #\= 3, Frances #\= 3,
    Alemao #\= 2,
    Italiano #\= 1,
    labeling([], Corredores),
    escrever(Corredores, 1).

escrever([], _).
escrever([Corredor|Corredores], N) :-
    nome(N, Nome), corresponder(N, NrMarca), marca(NrMarca, Corredor, Marca),
    write(Nome), write(' da marca '), write(Marca), write(' ficou em '), write(Corredor), nl,
    N1 is N + 1,
    escrever(Corredores, N1).