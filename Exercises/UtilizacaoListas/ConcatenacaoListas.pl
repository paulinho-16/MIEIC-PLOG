% append(L1, L2, L) -> L é uma lista constituída pela concatenação das listas L1 e L2
append([], L, L).
append([X|L1], L2, [X|L3]) :- append(L1, L2, L3).