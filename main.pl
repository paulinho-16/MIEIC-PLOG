:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).

:- consult('board.pl').
:- consult('logic.pl').
:- consult('display.pl').
:- consult('menus.pl').

reset_timer:-
    statistics(total_runtime, _).

print_time(Msg):-
    statistics(total_runtime,[_,T]),
    TS is ((T//10)*10)/1000, 
    nl, write(Msg), write(TS), write('s'), nl, nl.

only_empty([], _).
only_empty([_-X-Y | Cells], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY]) :-
    (PawnX #\= X #\/ PawnY #\= Y) #/\
    (KnightX #\= X #\/ KnightY #\= Y) #/\
    (KingX #\= X #\/ KingY #\= Y) #/\
    (RookX #\= X #\/ RookY #\= Y) #/\
    (BishopX #\= X #\/ BishopY #\= Y) #/\
    (QueenX #\= X #\/ QueenY #\= Y),
    only_empty(Cells, [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY]).


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
    size_board(Problem, Size),
    Predicate =.. [PredicateName, GameBoard, Size],
    Predicate,

    nl, nl, write('\t\t'), write(Problem),
    nl, nl, display_board(GameBoard),

    getCellsNumber(GameBoard, 1-1, Cells, Size), !,
    nl, write('Cells: '), write(Cells), nl,

    Positions = [_PawnX, _PawnY, _KnightX, _KnightY, _KingX, _KingY, _RookX, _RookY, _BishopX, _BishopY, _QueenX, _QueenY],
    %reset_timer,
    domain(Positions, 1, Size),
    
    not_overlapping(Positions),
    only_empty(Cells, Positions),

    maplist(cell_attacks(Positions), Cells), 
    %print_time('PostingConstraints: '), 
    labeling([anti_first_fail, bisect], Positions),
    %print_time('Labeling Time: '),
    %fd_statistics,
    %statistics,

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