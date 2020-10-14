% conta(Lista, N) -> sucesso se a lista Lista tem N elementos
conta([], 0).
conta([_|Lista], N) :-
    N > 0,
    N1 is N-1,
    conta(Lista, N1).

% conta_elem(X, Lista, N) -> sucesso se a lista Lista tem N elementos com o valor X
conta_elem(_, [], 0).
conta_elem(X, [X|Lista], N) :-
    N >= 0,
    N1 is N-1,
    conta_elem(X, Lista, N1).
conta_elem(X, [Y|Lista], N) :-
    N >= 0,
    X \= Y,
    conta_elem(X, Lista, N).