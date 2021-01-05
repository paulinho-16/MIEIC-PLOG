:- use_module(library(clpfd)).

task(1, 2, 1, 1).
task(2, 5, 4, 3).
task(3, 1, -11, -10).

% plan(N, Plan) -> resolve o problema do planeamento na política, para um número N de planos a aplicar, e devolve em Plan a sequência de planos a aplicar, com um dado custo
plan(N, Plan) :-
    make_plan(N, Plan),
    domain(Plan, 1, 3),
    evaluate_plan(Plan, 0, 0, 0, Du, Pa, Pe),
    Pe #>= 5, Pe #=< 6, Du #=< 10, Pa #=< 10,
    make_cost(0, Plan, Cost),
    minimize(labeling([], Plan), Cost),
    write('Found a solution with cost '), write(Cost), nl.

make_plan(0, []) :- !.
make_plan(N, [_|Rest]) :-
    N1 is N - 1,
    make_plan(N1, Rest).

evaluate_plan([], Du1, Pa1, Pe1, Du1, Pa1, Pe1).
evaluate_plan([Id|T], Du1, Pa1, Pe1, Du2, Pa2, Pe2) :-
    task(Id, DuD, PaD, PeD),
    Du is Du1 + DuD,
    Pa is Pa1 + PaD,
    Pe is Pe1 + PeD,
    evaluate_plan(T, Du, Pa, Pe, Du2, Pa2, Pe2).

make_cost(Cost, [], Cost).
make_cost(Sum, [Id | L], Cost) :-
    task(Id,_,PaD,_),
    S is Sum + PaD,
    make_cost(S, L, Cost).