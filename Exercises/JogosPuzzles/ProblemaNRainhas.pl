:- use_module(library(lists)).
:- use_module(library(between)).

% nQueens(N, Board) -> Devolve em Board a solução para o problema das N-Rainhas, com as posições de cada Rainha no formato Linha/Coluna, num tabuleiro NxN
%                      O problema consiste em colocar, num tabuleiro NxN, N Rainhas, sem que nenhuma rainha ataque uma outra rainha posicionada no tabuleiro
nQueens(N, Board) :-
    build_board(N, RevBoard),
    reverse(RevBoard, Board),
    queens(Board, N).

queens([], _).
queens([Row/Col|Rest], N) :-
    queens(Rest, N),
    numlist(N, List),
    member(Col, List),
    safe(Row/Col, Rest).

safe(_, []).
safe(Row/Col, [Row1/Col1|Rest]) :-
    Col =\= Col1,
    Col1 - Col =\= Row1 - Row,
    Col1 - Col =\= Row - Row1,
    safe(Row/Col, Rest).

build_board(0, []).
build_board(N, [N/_|PreviousBoard]) :-
    N > 0,
    N1 is  N - 1,
    build_board(N1, PreviousBoard).