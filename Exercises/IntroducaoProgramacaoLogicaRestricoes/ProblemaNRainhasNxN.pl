:- use_module(library(clpfd)).

% nqueens_4x4(Cols) -> resolve o problema das N-Rainhas num tabuleiro 4x4, armazenando as posições das Rainhas em Cols (coluna em cada linha)
nqueens_4x4(Cols) :-
    Cols = [A1, A2, A3, A4],
    domain(Cols, 1, 4),
    all_distinct(Cols),
    A1 #\= A2 + 1, A1 #\= A2 - 1, A1 #\= A3 + 2, A1 #\= A3 - 2, A1 #\= A4 + 3, A1 #\= A4 - 3,
    A2 #\= A3 + 1, A2 #\= A3 - 1, A2 #\= A4 + 2, A2 #\= A4 - 2,
    A3 #\= A4 + 1, A3 #\= A4 - 1,
    labeling([], Cols).

% nqueens(N, Cols) -> resolve o problema das N-Rainhas num tabuleiro NxN, armazenando as posições das Rainhas em Cols (coluna em cada linha)
%                     O problema consiste em colocar, num tabuleiro NxN, N rainhas de xadrez, sem que nenhuma rainha ataque uma outra rainha posicionada no tabuleiro (isto é, na horizontal, vertical ou diagonal)
nqueens(N, Cols) :-
    length(Cols, N),
    domain(Cols, 1, N),
    constrain(Cols),
    all_distinct(Cols),     % Redundante mas diminui o tempo de resolução
    labeling([], Cols).

constrain([]).
constrain([H | RCols]) :-
    safe(H, RCols, 1),
    constrain(RCols).

safe(_, [], _).
safe(X, [Y | T], K) :-
    noattack(X, Y, K),
    K1 is K + 1,
    safe(X, T, K1).

noattack(X, Y, K) :-
    X #\= Y,
    X + K #\= Y,
    X - K #\= Y.