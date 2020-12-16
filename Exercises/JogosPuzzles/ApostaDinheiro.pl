:- use_module(library(lists)).

% aposta -> determina o valor das caixas de modo a vencer a aposta e mostra o valor de cada caixa e o valor total ganho
aposta :-
    bagof(Lista, (length(Lista, 9), verificar_condicoes(Lista)), [Possibilidade|_]),
    write('Caixas: '), write(Possibilidade), nl,
    sumlist(Possibilidade, Sum),
    write('Valor: '), write(Sum).

verificar_condicoes(Lista) :-
    coluna(Lista),
    cantos(Lista),
    segunda(Lista),
    nota(Lista),
    linha(Lista).

linha([C1, C2, C3|Lista]) :-
    count([C1, C2, C3], 1000, 1),
    linha(Lista).
linha([]).

count([], _, 0).
count([Money|List], Money, N) :-
    N > 0, !,
    N1 is N - 1,
    count(List, Money, N1).
count([_|List], Money, N) :-
    N >= 0,
    count(List, Money, N).

cantos(Lista) :-
    nth1(1, Lista, C1),
    nth1(3, Lista, C3),
    nth1(7, Lista, C7),
    nth1(9, Lista, C9),
    count([C1, C3, C7, C9], 500, 3).

segunda(Lista) :-
    nth1(4, Lista, C4),
    nth1(5, Lista, C5),
    nth1(6, Lista, C6),
    count([C4, C5, C6], 2000, 2).

coluna(Lista) :-
    nth1(3, Lista, C3),
    nth1(6, Lista, C6),
    nth1(9, Lista, C9),
    count([C3, C6, C9], 1000, 2).

nota([C1, C2, C3, C4, C5, C6|_]) :-
    count([C1, C2, C3, C4, C5, C6], 5000, 1).