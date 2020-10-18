% tem_fator(N, F) -> determina se um dado número N é divisível por F
tem_fator(N, F) :- N mod F =:= 0.
tem_fator(N, F) :-
    F * F < N,
    F2 is F + 2,
    tem_fator(N, F2).

% primo(N) -> sucesso se N é um número primo
primo(2).
primo(3).
primo(N) :-
    integer(N),
    N > 3,
    N mod 2 =\= 0,
    \+ tem_fator(N, 3).

% lista_primos(N, Lista) -> determina a lista de todos os números primos iguais ou inferiores a N
lista_primos(2, [2]).
lista_primos(N, Lista) :-
    N > 1,
    \+ primo(N),
    N1 is N - 1,
    lista_primos(N1, Lista).
lista_primos(N, Lista) :-
    N > 1,
    primo(N),
    N1 is N - 1,
    lista_primos(N1, L1),
    append(L1, [N], Lista).