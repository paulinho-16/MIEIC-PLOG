:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).

:- consult('board.pl').
:- consult('logic.pl').
:- consult('display.pl').
:- consult('menus.pl').

% ------------------------------------------------------------------------------------------------------------------------- %
%                                              Solve Problem                                                                %
%   Prototype:                                                                                                              %
%       solve(-Positions)                                                                                                   %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Positions -> The positions of the chess pieces, after solving a Chess-Num problem, chosen by the user               %
% ------------------------------------------------------------------------------------------------------------------------- %

solve(Positions) :-
    display_menu,

    input(N, 0, 12, 'Problem to solve? ', problems),
    N \= exit,

    predicate(N, PredicateName, Problem),
    Predicate =.. [PredicateName, GameBoard],
    Predicate,

    nl, nl, write('\t\t'), write(Problem),
    nl, nl, display_board(GameBoard),

    getCellsNumber(GameBoard, 1-1, Cells), !,
    nl, write('Cells: '), write(Cells), nl,

    Positions = [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY],
    domain(Positions, 1, 8),

    not_overlapping(Positions),
         
    maplist(cell_attacks(GameBoard, Positions), Cells),

    labeling([], Positions),

    get_value(PawnX, PawnY, GameBoard, empty),
    get_value(KnightX, KnightY, GameBoard, empty),
    get_value(KingX, KingY, GameBoard, empty),
    get_value(RookX, RookY, GameBoard, empty),
    get_value(BishopX, BishopY, GameBoard, empty),
    get_value(QueenX, QueenY, GameBoard, empty),

    nl, show_results(Positions, 1), nl,
    display_solution(GameBoard, Positions).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                              Piece                                                                        %
%   Prototype:                                                                                                              %
%       piece(+Number, -Name)                                                                                               %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Number -> The number of the chess piece                                                                             %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Name -> The name of the chess piece                                                                                 %
% ------------------------------------------------------------------------------------------------------------------------- %

piece(1, 'Pawn').
piece(2, 'Knight').
piece(3, 'King').
piece(4, 'Rook').
piece(5, 'Bishop').
piece(6, 'Queen').

% ------------------------------------------------------------------------------------------------------------------------- %
%                                              Show Results                                                                 %
%   Prototype:                                                                                                              %
%       show_results(+Positions, +N)                                                                                        %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Positions -> The positions of the chess pieces, in the format [Row, Column]                                         %
%       N -> The number of the next chess piece to print on the screen                                                      %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Prints the chess pieces' positions to the screen, showing the solution for the Chess-Num problem                    %
% ------------------------------------------------------------------------------------------------------------------------- %

show_results([], _).
show_results([X, Y|Positions], N) :-
    piece(N, Piece),
    write(Piece), write(' is at cell ['), write(X), write(', '), write(Y), write(']'), nl,
    N1 is N + 1,
    show_results(Positions, N1).