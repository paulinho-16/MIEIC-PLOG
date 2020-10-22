% pascal(N, L) -> devolve a N-ésima linha do triângulo de Pascal, armazenando-a em L
pascal(1, [1]).
pascal(2, [1, 1]).
pascal(N, L) :-
    N > 2,
    N1 is N - 1,
    pascal(N1, L1),
    soma_combinada(L1, Num),
    append([1|Num], [1], L).

soma_combinada([X, Y], [Z]) :- Z is X + Y.
soma_combinada([X, Y|L], LZ) :-
    Soma is X + Y,
    soma_combinada([Y|L], NLZ),
    LZ = [Soma|NLZ].