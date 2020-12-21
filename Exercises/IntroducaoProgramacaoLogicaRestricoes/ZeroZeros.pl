:- use_module(library(clpfd)).

% zero_zeros(Fator1, Fator2) -> devolve em Fator1 e Fator2 dois fatores, de forma a que o seu produto dê 1 000 000 000, e que nenhum dos fatores contenha quaisquer zeros
zero_zeros(Fator1, Fator2) :-
    domain([Fator1, Fator2], 1, 1000000000),
    Fator1 * Fator2 #= 1000000000,
    Fator1 #> Fator2,
    sem_zeros(Fator1),
    sem_zeros(Fator2),
    labeling([], [Fator1, Fator2]).

sem_zeros(0).
sem_zeros(Fator) :-
    Fator mod 10 #\= 0,
    NextFator #= Fator // 10,
    sem_zeros(NextFator).