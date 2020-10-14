% membro(X, L) -> sucesso se X for um membro da lista L
membro(X, [X|T]).
membro(X, [Y|T]) :- membro(X, T).

% membroAppend(X, L) -> sucesso se X for um membro da lista L, usando o predicado append
membroAppend(X, L) :- append(_, [X|_], L).

% last(L, X) -> retorna o último elemento de uma lista L, armazenado em X
last(L, X) :- append(_, [X], L).

% nth_member(N, L, X) -> retorna o N-ésimo membro de uma lista L, armazenado em X
nth_member(1, [X|_], X).
nth_member(N, [_|T], X) :-
    N > 1,
    N1 is N-1,
    nth_member(N1, T, X).