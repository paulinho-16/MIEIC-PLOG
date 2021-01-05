:- use_module(library(clpfd)).

% schedule(Times) -> constrói um escalonador para o dia do Sr. Paulino, armazenando o resultado em Times
schedule(Times) :-
    Times = [WakeUp,TakeBus1,StartWork,TakeBus2,TurnTVOn,FallASleep],
    domain(Times,1,24),
    WakeUp #>= 6,
    WakeUp #=< TakeBus1 - 1,
    TakeBus1 #< StartWork - 1,
    StartWork #< TakeBus2 - 8,
    TakeBus2 #< TurnTVOn - 1,
    TurnTVOn #< FallASleep - 3,
    labeling([], Times).