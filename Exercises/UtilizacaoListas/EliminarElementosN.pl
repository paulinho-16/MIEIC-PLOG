% dropN(L1, N, L2) -> elimina elementos de N em N na lista L1, armazenando o resultado em L2
dropN(L1, N, L2) :- dropNemN(L1, N, L2, N).

dropNemN([], _, [], _).
dropNemN([_|L1], 1, L2, NN) :- dropNemN(L1, NN, L2, NN).
dropNemN([X|L1], N, [X|L2], NN) :-
    N > 1,
    N1 is N - 1,
    dropNemN(L1, N1, L2, NN).