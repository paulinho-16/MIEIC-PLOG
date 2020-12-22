:- use_module(library(clpfd)).

nome(1, 'Joao').
nome(2, 'Antonio').
nome(3, 'Francisco').

instrumento(1, 'Harpa').
instrumento(2, 'Violino').
instrumento(3, 'Piano').

flatten([], []).
flatten([H | T], FlatBoard):-
    flatten(T, NewFlat),
    append(H, NewFlat, FlatBoard).

% musicos -> resolve o problema dos Três Músicos, com base na informação dada
musicos :-
    Musicos = [Nomes, Instrumentos],
    Nomes = [1, 2, 3],
    Instrumentos = [_Harpa, Violino, Piano],
    flatten(Musicos, Flat),
    domain(Flat, 1, 3),
    all_distinct(Nomes),
    all_distinct(Instrumentos),
    2 #\= Piano,
    1 #\= Violino,
    1 #\= Piano,
    labeling([], Flat),
    escrever(Musicos, [1, 2, 3]).

escrever([[], _], _).
escrever([[Musico|Musicos], Instrumentos], NomesInst) :-
    nome(Musico, Nome),
    element(N, NomesInst, Musico), instrumento(N, NomeInst),
    write('O '), write(Nome), write(' toca '), write(NomeInst), nl,
    escrever([Musicos, Instrumentos], NomesInst).