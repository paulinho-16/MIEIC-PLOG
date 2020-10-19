% duplicar(L1, L2) -> duplica os elementos da lista L1, armazenando o resultado em L2
duplicar([], []).
duplicar([X|L1], L2) :- 
    duplicar(L1, NewL2),
    append([X,X], NewL2, L2).

% duplicarN(L1, N, L2) -> copia os elementos da lista L1 N vezes para a lista L2
duplicarN([], _, []).
duplicarN([X|L1], N, L2) :-
    duplN(X, N, [], LAcc),
    duplicarN(L1, N, NewL2),
    append(LAcc, NewL2, L2).

duplN(_, 0, LAcc, LAcc).
duplN(X, N, Acc, LAcc) :-
    N > 0,
    N1 is N - 1,
    duplN(X, N1, [X|Acc], LAcc).