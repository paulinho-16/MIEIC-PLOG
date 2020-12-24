:- use_module(library(clpfd)).

% reunioes_eleitorais -> resolve o problema das reuniões eleitorais, apresentando o número de pessoas que participaram numa única reunião
reunioes_eleitorais :-
    Pessoas = [Pessoas1, Pessoas2, Pessoas3],
    domain(Pessoas, 1, 200),
    Pessoas3 #= 30,
    Pessoas3 + 130 - Pessoas3 + 135 - Pessoas3 + 65 - Pessoas3 - Pessoas2 #= 200,
    Pessoas1 #= 200 - Pessoas3 - Pessoas2,
    labeling([], Pessoas),
    write(Pessoas1), write(' pessoas participaram numa unica reuniao'), nl.