% substitui(X, Y, Lista1, Lista2) -> substitui todas as ocorrências de X em Lista1 por Y, armazenando a nova lista em Lista2
substitui(_, _, [], []).
substitui(X, Y, [X|Lista1], [Y|Lista2]) :- substitui(X, Y, Lista1, Lista2).
substitui(X, Y, [Z|Lista1], [Z|Lista2]) :-
    X \= Z,
    substitui(X, Y, Lista1, Lista2).

% present(X, L) -> sucesso se X estiver presente na lista L
present(X, L) :- append(_, [X|_], L).

% elimina_duplicados(Lista1, Lista2) -> elimina os duplicados na lista Lista1, armazenando a nova lista em Lista2
elimina_duplicados(Lista1, Lista2) :- elimina_dup(Lista1, [], Lista2).

elimina_dup([], _, []).
elimina_dup([X|Lista1], Processed, Lista2) :- 
    present(X, Processed),
    elimina_dup(Lista1, Processed, Lista2).
elimina_dup([X|Lista1], Processed, [X|Lista2]) :- 
    \+present(X, Processed),
    elimina_dup(Lista1, [X|Processed], Lista2).