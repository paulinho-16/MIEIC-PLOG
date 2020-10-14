% delete_one(X, L1, L2) -> remove uma ocorrência de um item X na lista L1, armazenando a nova lista em L2
delete_one(X, L1, L2) :- append(Li, [X|Lf], L1), append(Li, Lf, L2).

% delete_all(X, L1, L2) -> remove todas as ocorrências de um item X na lista L1, armazenando a nova lista em L2
delete_all(_, [], []).
delete_all(X, [X|L1], L2) :- delete_all(X, L1, L2).
delete_all(X, [Y|L1], [Y|L2]) :- X \= Y, delete_all(X, L1, L2).

% delete_all_list(LX, L1, L2) -> remove as ocorrências dos elementos que se encontram numa lista LX, da lista L1, armazenando a nova lista em L2
delete_all_list([], L2, L2).
delete_all_list([X|LX], L1, L2) :- delete_all(X, L1, R), delete_all_list(LX, R, L2).