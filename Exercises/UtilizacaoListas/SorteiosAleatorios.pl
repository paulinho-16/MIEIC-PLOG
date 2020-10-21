:- use_module(library(random)).

% rnd_selectN(Lista, N, L) -> extrai N elementos da lista Lista selecionados aleatoriamente, e armazena-os em L
rnd_selectN(Lista, N, L) :- rnd_N(Lista, N, [], L).

rnd_N(_, 0, L, L).
rnd_N(Lista, N, LAcc, L) :-
    N > 0,
    N1 is N - 1,
    length(Lista, Tam),
    Len is Tam + 1,
    random(1, Len, R),
    procurar_ind(Lista, R, Val),
    append(LAcc, [Val], NewLAcc),
    rnd_N(Lista, N1, NewLAcc, L).

procurar_ind([X|_], 1, X).
procurar_ind([_|Lista], R, Val) :-
    R > 1,
    R1 is R - 1,
    procurar_ind(Lista, R1, Val).

% rnd_select(N, M, L) -> sorteia N elementos entre 1 e M aleatoriamente, armazenando-os em L
rnd_select(N, M, L) :- rnd(N, M, [], L).

rnd(0, _, L, L).
rnd(N, M, LAcc, L) :-
    N1 is N - 1,
    M1 is M + 1,
    random(1, M1, Num),
    append(LAcc, [Num], NewLAcc),
    rnd(N1, M, NewLAcc, L).

% rnd_permutation(Lista, L) -> gera uma permutação aleatória dos elementos da lista Lista, armazenando o resultado em L
rnd_permutation(Lista, L) :- rnd_perm(Lista, [], L).

rnd_perm([], L, L).
rnd_perm(Lista, LAcc, L) :-
    length(Lista, Len),
    Lim is Len + 1,
    random(1, Lim, Ind),
    find_index(Lista, Ind, Num, [], NewLista),
    append(LAcc, [Num], NewLAcc),
    rnd_perm(NewLista, NewLAcc, L).

find_index(_, 0, _, NewLista, NewLista).
find_index([Num|Resto], 1, Num, AddLista, NewLista) :- append(AddLista, Resto, ListaFinal), find_index(_, 0, Num, ListaFinal, NewLista).
find_index([X|Lista], Ind, Num, AddLista, NewLista) :-
    Ind > 1,
    Ind1 is Ind - 1,
    append(AddLista, [X], AddLista2),
    find_index(Lista, Ind1, Num, AddLista2, NewLista).