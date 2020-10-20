% runlength(Lista, X) -> realiza a compressão run-length da lista Lista, armazenando o resultado em X
runlength(Lista, X) :- runl(Lista, [], X).

runl([], X, X).
runl([H|Lista], XI, X) :-
    runl_contar(H, Lista, NewLista, 1, N),
    append(XI, [[N, H]], NewXI),
    runl(NewLista, NewXI, X).

runl_contar(_, [], [], N, N).
runl_contar(H, [Y|Lista], [Y|Lista], N, N) :- H \= Y.
runl_contar(H, [H|Lista], NewLista, Acc, N) :-
    Acc1 is Acc + 1,
    runl_contar(H, Lista, NewLista, Acc1, N).

% run_length_modificado(Lista, X) -> o mesmo que runlength(Lista, X), mas se um elemento não tiver duplicados, é simplesmente copiado para a lista resultado (X)
run_length_modificado(Lista, X) :- runl_mod(Lista, [], X).

runl_mod([], X, X).
runl_mod([H|Lista], XI, X) :-
    runl_mod_contar(H, Lista, NewLista, 1, N),
    N > 1,
    append(XI, [[N, H]], NewXI),
    runl_mod(NewLista, NewXI, X).
runl_mod([H|Lista], XI, X) :-
    runl_mod_contar(H, Lista, NewLista, 1, N),
    N == 1,
    append(XI, [H], NewXI),
    runl_mod(NewLista, NewXI, X).

runl_mod_contar(_, [], [], N, N).
runl_mod_contar(H, [Y|Lista], [Y|Lista], N, N) :- H \= Y.
runl_mod_contar(H, [H|Lista], NewLista, Acc, N) :-
    Acc1 is Acc + 1,
    runl_mod_contar(H, Lista, NewLista, Acc1, N).

% descompressao(X, Lista) -> realiza a descompressão da lista X, codificada em run-length, para ambos os casos anteriores
descompressao(X, Lista) :- descompress(X, [], Lista).

descompress([], Lista, Lista).
descompress([ML|X], ListaAcc, Lista) :-
    \+ atom(ML),
    decompor(ML, Extended),
    append(ListaAcc, Extended, NovaListaAcc),
    descompress(X, NovaListaAcc, Lista).
descompress([ML|X], ListaAcc, Lista) :-
    atom(ML),
    append(ListaAcc, [ML], NovaListaAcc),
    descompress(X, NovaListaAcc, Lista).

decompor([N,C|_], Extended) :-
    dec_ciclo(N, C, [], Extended).

dec_ciclo(0, _, Extended, Extended).
dec_ciclo(N, C, Ext, Extended) :-
    N > 0,
    N1 is N - 1,
    append(Ext, [C], NewExt),
    dec_ciclo(N1, C, NewExt, Extended).