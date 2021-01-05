:- use_module(library(clpfd)).

time([_], 0).
time([H1, H2 | T], Time) :-
    time([H2 | T], PreviousTime),
    Time #= abs(H2 - H1) + PreviousTime.

% carteiro_preguicoso(Houses, Time, NrHouses) -> resolve o problema do carteiro preguiçoso para um número NrHouses de casas, devolvendo em Houses a sequência de casas visitadas e em Time o tempo total que demorou a percorrê-las
carteiro_preguicoso(Houses, Time, NrHouses) :-
    length(Houses, NrHouses),
    domain(Houses, 1, NrHouses),
    element(NrHouses, Houses, 6),
    circuit(Houses),
    time(Houses, Time),
    labeling([maximize(Time)], Houses).