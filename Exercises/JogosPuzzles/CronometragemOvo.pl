% Estado inicial e final das ampulhetas (Ampulheta1-Ampulheta2-Tempo)
initial(0-0-0).
final(_-_-15).

% Iniciar a primeira ampulheta (de 11 minutos)
next(0-O-Tempo, 11-O-Tempo, iniciar1) :- Tempo < 15, Tempo + O =\= 15, Tempo + 7 - O =\= 15.

% Iniciar a segunda ampulheta (de 7 minutos)
next(O-0-Tempo, O-7-Tempo, iniciar2) :- Tempo < 15, Tempo + O =\= 15, Tempo + 11 - O =\= 15.

% Esvaziar a próxima ampulheta a terminar
next(A-O-Tempo, 0-NO-NovoTempo, esvaziar1) :-
    A < O,
    Tempo < 15,
    NovoTempo is Tempo + A,
    NO is O - A.

% Esvaziar a próxima ampulheta a terminar
next(A-O-Tempo, NA-0-NovoTempo, esvaziar2) :-
    O < A,
    Tempo < 15,
    NovoTempo is Tempo + O,
    NA is A - O.

% Esvaziar a ampulheta restante
next(O-0-Tempo, 0-0-NovoTempo, esvaziar1) :-
    Tempo < 15,
    NovoTempo is Tempo + O.

% Esvaziar a ampulheta restante
next(0-O-Tempo, 0-0-NovoTempo, esvaziar2) :-
    Tempo < 15,
    NovoTempo is Tempo + O.

% Virar a primeira ampulheta (de 11 minutos)
next(Antes-O-Tempo, Apos-O-Tempo, virar1) :- Tempo < 15, Tempo + O =\= 15, Tempo + 7 - O =\= 15, Apos is 11 - Antes.

% Virar a segunda ampulheta (de 7 minutos)
next(O-Antes-Tempo, O-Apos-Tempo, virar2) :- Tempo < 15, Tempo + O =\= 15, Tempo + 11 - O =\= 15, Apos is 7 - Antes.

% solve_ampulhetas(EstadosAmpulhetas, Operacoes) -> Devolve em EstadosAmpulhetas a sequência de estados das 2 ampulhetas que leva ao objetivo (Cronometrarem 15 minutos),
%                                          e em Operacoes a sequência de operações necessárias para alcançar esse objetivo, sendo que a primeira ampulheta é de 11 minutos e a segunda de 7 minutos
solve_ampulhetas(EstadosAmpulhetas, Operacoes) :-
    initial(Initial),
    final(Final),
    setof(Len-Estados-Ops, (dfs(Initial, Final, [Initial], Estados, Ops), length(Estados, Len)), [_MinLen-EstadosAmpulhetas-Operacoes|_]).
    
% Pesquisa em profundidade para obter a sequência de movimentos necessários para chegar ao objetivo (As ampulhetas cronometrarem 15 minutos)
dfs(End, End, Path, Path, []).
dfs(Start, End, Temp, Path, [Op | Rest]) :-
    next(Start, Mid, Op),
    \+ member(Mid, Temp),
    append(Temp, [Mid], NewTemp),
    dfs(Mid, End, NewTemp, Path, Rest).