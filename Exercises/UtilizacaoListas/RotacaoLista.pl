% rodar(Lista, N, X) -> roda N elementos para a esquerda da lista Lista, armazenando o resultado em X
rodar(Lista, N, X) :- rodar_lista(Lista, N, [], X).

rodar_lista(Lista, 0, X, Result) :- append(Lista, X, Result).
rodar_lista([H|Lista], N, LAcc, X) :-
    N > 0,
    N1 is N - 1,
    append(LAcc, [H], NewLAcc),
    rodar_lista(Lista, N1, NewLAcc, X).
rodar_lista(Lista, N, LAcc, X) :-
    N < 0,
    length(Lista, NN),
    NewN is NN + N,
    rodar_lista(Lista, NewN, LAcc, X).