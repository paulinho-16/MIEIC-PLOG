% Estado inicial e final do balde
initial(0-0).
final(2-_).

% Esvaziar o primeiro balde
next(_-Y, 0-Y, empty1).

% Esvaziar o segundo balde
next(X-_, X-0, empty2).

% Encher o primeiro balde
next(_-Y, 4-Y, fill1).

% Encher o segundo balde
next(X-_, X-3, fill2).

% Despejar do primeiro para o segundo balde
next(X-Y, X1-Y1, dump12) :-
    X > 0,
    Y < 3,
    Diff is 3 - Y,
    T is min(X, Diff),
    X1 is X - T,
    Y1 is Y + T.

% Despejar do segundo para o primeiro balde
next(X-Y, X1-Y1, dump21) :-
    Y > 0,
    X < 4,
    Diff is 4 - X,
    T is min(Y, Diff),
    X1 is X + T,
    Y1 is Y - T.

% solve_baldes(EstadosBalde, Operacoes) -> Devolve em EstadosBalde a sequência de estados dos 2 baldes que leva ao objetivo (primeiro balde conter 2 litros),
%                                          e em Operacoes a sequência de operações necessárias para alcançar esse objetivo, sendo que o primeiro balde tem capacidade de 4 litros e o segundo de 3 litros
solve_baldes(EstadosBalde, Operacoes) :-
    initial(Initial),
    final(Final),
    setof(Len-Estados-Ops, (dfs(Initial, Final, [Initial], Estados, Ops), length(Estados, Len)), [_MinLen-EstadosBalde-Operacoes|_]).
    
% Pesquisa em profundidade para obter a sequência de movimentos necessários para chegar ao objetivo (primeiro balde conter 2 litros)
dfs(End, End, Path, Path, []).
dfs(Start, End, Temp, Path, [Op | Rest]) :-
    next(Start, Mid, Op),
    \+ member(Mid, Temp),
    append(Temp, [Mid], NewTemp),
    dfs(Mid, End, NewTemp, Path, Rest).