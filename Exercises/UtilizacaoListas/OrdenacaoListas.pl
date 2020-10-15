% ordenada(Lista) -> verdadeiro se Lista é uma lista de inteiros ordenada
ordenada([_]).
ordenada([N1, N2 | Lista]) :-
    N1 =< N2,
    ordenada([N2|Lista]).

% ordena(L1, L2) -> ordena a lista L1, armazenando a nova lista em L2 (algoritmo Insert-Sort)
ordena(L1, L2) :- insert_sort(L1, [], L2).

insert_sort([], L2, L2).
insert_sort([H|L1], Processed, L2) :-
    insert(H, Processed, NewProcessed),
    insert_sort(L1, NewProcessed, L2).

insert(X, [Y|T], [Y|NT]) :- X > Y, insert(X, T, NT).
insert(X, [Y|T], [X,Y|T]) :- X =< Y.
insert(X, [], [X]).