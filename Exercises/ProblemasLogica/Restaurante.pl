:- use_module(library(clpfd)).

nome(1, 'Bernard').
nome(2, 'Daniel').
nome(3, 'Francisco').
nome(4, 'Henrique').
nome(5, 'Jaqueline').
nome(6, 'Luis').

prato(1, 'Peixe').
prato(2, 'Porco').
prato(3, 'Pato com Laranja').
prato(4, 'Omeleta').
prato(5, 'Bife').
prato(6, 'Esparguete ao alho e oleo').

% restaurante -> resolve o problema do restaurante, com base na informação dada
restaurante :-
    Pratos = [Peixe, Porco, PatoLaranja, Omeleta, Bife, _EspargueteAlhoOleo],
    domain(Pratos, 1, 6),
    all_distinct(Pratos),
    Peixe #\= 2, Peixe #\= 5,
    Porco #\= 3, PatoLaranja #\= 3,
    Omeleta #\= 1, Omeleta #\= 2, PatoLaranja #\= 1, PatoLaranja #\= 2,
    member(1, [Porco, PatoLaranja, Bife]), member(3, [Porco, PatoLaranja, Bife]), member(4, [Porco, PatoLaranja, Bife]),
    labeling([], Pratos),
    escrever(Pratos, 1).

escrever([], _).
escrever([Prato|Pratos], N) :-
    nome(Prato, Nome),
    prato(N, NomePrato),
    write(Nome), write(' pediu '), write(NomePrato), nl,
    N1 is N + 1,
    escrever(Pratos, N1).