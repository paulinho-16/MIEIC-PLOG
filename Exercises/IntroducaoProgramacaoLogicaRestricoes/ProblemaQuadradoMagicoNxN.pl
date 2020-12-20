:- use_module(library(clpfd)).
:-use_module(library(lists)).

% quadrado_magico_3x3(Quadrado) -> resolve o problema do quadrado mágico para um quadrado 3x3, armazenando o resultado em Quadrado
quadrado_magico_3x3(Quadrado) :-
    Quadrado = [A1, A2, A3, A4, A5, A6, A7, A8, A9],
    domain(Quadrado, 1, 9),
    Soma is (9 + 1) * 3 // 2,   % Aumenta a eficiência
    all_distinct(Quadrado),
    A1 + A2 + A3 #= Soma,
    A4 + A5 + A6 #= Soma,
    A7 + A8 + A9 #= Soma,
    A1 + A4 + A7 #= Soma,
    A2 + A5 + A8 #= Soma,
    A3 + A6 + A9 #= Soma,
    A1 + A5 + A9 #= Soma,
    A3 + A5 + A7 #= Soma,
    A1 #< A2, A1 #< A3, A1 #< A4, A2 #< A4,     % Elimina simetrias
    labeling([], Quadrado).

% quadrado_magico_4x4(Quadrado) -> resolve o problema do quadrado mágico para um quadrado 4x4, armazenando o resultado em Quadrado
quadrado_magico_4x4(Quadrado) :-
    Quadrado = [A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16],
    domain(Quadrado, 1, 16),
    Soma is (16 + 1) * 4 // 2,   % Aumenta a eficiência
    all_distinct(Quadrado),
    A1 + A2 + A3 + A4 #= Soma,
    A5 + A6 + A7 + A8 #= Soma,
    A9 + A10 + A11 + A12 #= Soma,
    A13 + A14 + A15 + A16 #= Soma,
    A1 + A5 + A9 + A13 #= Soma,
    A2 + A6 + A10 + A14 #= Soma,
    A3 + A7 + A11 + A15 #= Soma,
    A4 + A8 + A12 + A16 #= Soma,
    A1 + A6 + A11 + A16 #= Soma,
    A4 + A7 + A10 + A13 #= Soma,
    labeling([], Quadrado).

flatten([], []).
flatten([H | T], FlatBoard):-
    flatten(T, NewFlat),
    append(H, NewFlat, FlatBoard).

diagonal1([], []).
diagonal1([[E|_]|Ess], [E|Ds]) :-
    maplist(tail_lista, Ess, Ess0),
    diagonal1(Ess0, Ds).

diagonal2(Ess,Ds) :-
    maplist(reverse, Ess, Fss),
    diagonal1(Fss, Ds).

formar_linhas(Size, Board):- length(Board, Size).

dominio_linhas(Start, End, List):- domain(List, Start, End).

soma_lista(Soma, Operador, List):- sum(List, Operador, Soma).

tail_lista([_|Es], Es).

% quadrado_magico(N, Quadrado) -> resolve o problema do quadrado mágico para um quadrado de quaisquer dimensões (NxN)
%                                 O problema consiste em preencher o quadrado com os números entre 1 e N*N, sendo que cada número é utilizado uma única vez, de forma a que a soma das linhas, colunas e diagonais (principais) sejam idênticas
quadrado_magico(N, FinalQuadrado) :-
    length(Quadrado, N),
    MaxValue is N * N,
    Sum is (MaxValue + 1) * N // 2,
    maplist(formar_linhas(N), Quadrado),
    flatten(Quadrado, FlatQuadrado),
    all_distinct(FlatQuadrado), 
    maplist(dominio_linhas(1, MaxValue), Quadrado),
    maplist(soma_lista(Sum, #=), Quadrado),
    transpose(Quadrado, TransQuadrado),
    maplist(soma_lista(Sum, #=), TransQuadrado),
    diagonal1(Quadrado, Diag1),
    soma_lista(Sum, #=, Diag1),
    diagonal2(Quadrado, Diag2),
    soma_lista(Sum, #=, Diag2),
    maplist(labeling([]), Quadrado),
    flatten(Quadrado, FinalQuadrado).