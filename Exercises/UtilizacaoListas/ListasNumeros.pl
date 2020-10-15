% lista_ate(N, L) -> devolve a lista L de todos os números inteiros entre 1 e N
lista_ate(1, [1]).
lista_ate(N, L) :-
    N > 1,
    N1 is N-1,
    lista_ate(N1, L2),
    append(L2, [N], L).

% lista_entre(N1, N2, L) -> devolve a lista L de todos os números inteiros entre N1 e N2 (ambos incluídos)
lista_entre(N, N, [N]).
lista_entre(N1, N2, L) :-
    N2 >= N1,
    Nless is N2 - 1,
    lista_entre(N1, Nless, L2),
    append(L2, [N2], L).

% soma_lista(L, Soma) -> soma todos os elementos da lista L, armazenando o resultado em Soma
soma_lista(L, Soma) :- sum_list(L, 0, Soma).

sum_list([], Soma, Soma).
sum_list([X|T], Sum, Soma) :-
    NewSum is Sum + X,
    sum_list(T, NewSum, Soma).

% par(N) -> determina se o número inteiro N é ou não um número par
par(N) :- N mod 2 =:= 0.

% lista_pares(N, Lista) -> determina a lista Lista de todos os números pares iguais ou inferiores ao número N
lista_pares(N, Lista) :- list_even(N, [], Lista).

list_even(0, Lista, Lista).
list_even(N, Process, Lista) :-
    N > 0,
    N1 is N-1,
    par(N),
    list_even(N1, [N|Process], Lista).
list_even(N, Process, Lista) :-
    N > 0,
    N1 is N-1,
    \+par(N),
    list_even(N1, Process, Lista).

% lista_impares(N, Lista) -> determina a lista Lista de todos os números ímpares iguais ou inferiores ao número N
lista_impares(N, Lista) :- list_odd(N, [], Lista).

list_odd(0, Lista, Lista).
list_odd(N, Process, Lista) :-
    N > 0,
    N1 is N-1,
    \+par(N),
    list_odd(N1, [N|Process], Lista).
list_odd(N, Process, Lista) :-
    N > 0,
    N1 is N-1,
    par(N),
    list_odd(N1, Process, Lista).