:- use_module(library(lists)).
:- use_module(library(clpfd)).

:- consult('board.pl').
:- consult('logic.pl').
:- consult('display.pl').
:- consult('menus.pl').

testar(Positions) :-
    %problemOne(GameBoard),
    %problemPawn(GameBoard),

    display_menu,

    input(N, 0, 11, 'Problem to solve? ', problems),
    N \= exit,

    predicate(N, PredicateName, Problem),
    
    Predicate =.. [PredicateName, GameBoard],

    Predicate,

    %testing(GameBoard),

    nl, nl, write('\t\t'), write(Problem),
    nl, nl, display_board(GameBoard),

    getCellsNumber(GameBoard, 1-1, Cells), !,
    nl, write('Cells: '), write(Cells), nl,

    %Positions = [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY],
    Positions = [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY],
    domain(Positions, 1, 8),

    % Alternativa a not_overlapping:
    /*(((PawnX #\= KnightX) #\/ (PawnY #\= KnightY)) #/\
    ((PawnX #\= KingX) #\/ (PawnY #\= KingY)) #/\
    ((PawnX #\= RookX) #\/ (PawnY #\= RookY)) #/\
    ((PawnX #\= QueenX) #\/ (PawnY #\= QueenY)) #/\
    ((PawnX #\= BishopX) #\/ (PawnY #\= BishopY)) #/\

    ((KingX #\= KnightX) #\/ (KingY #\= KnightY)) #/\
    ((KingX #\= RookX) #\/ (KingY #\= RookY)) #/\
    ((KingX #\= QueenX) #\/ (KingY #\= QueenY)) #/\
    ((KingX #\= BishopX) #\/ (KingY #\= BishopY)) #/\

    ((KnightX #\= RookX) #\/ (KnightY #\= RookY)) #/\
    ((KnightX #\= BishopX) #\/ (KnightY #\= BishopY)) #/\
    ((KnightX #\= QueenX) #\/ (KnightY #\= QueenY)) #/\

    ((RookX #\= BishopX) #\/ (RookY #\= BishopY)) #/\
    ((RookX #\= QueenX) #\/ (RookY #\= QueenY)) #/\

    ((QueenX #\= BishopX) #\/ (QueenY #\= BishopY))),*/

    not_overlapping(Positions),
         
    maplist(cell_attacks(GameBoard, Positions), Cells),

    labeling([], Positions),

    get_value(PawnX, PawnY, GameBoard, empty),
    get_value(KnightX, KnightY, GameBoard, empty),
    get_value(KingX, KingY, GameBoard, empty),
    get_value(RookX, RookY, GameBoard, empty),
    get_value(BishopX, BishopY, GameBoard, empty),
    get_value(QueenX, QueenY, GameBoard, empty),

    nl, show_results(Positions, 1), nl.

% testar(_) :- write('Exiting...'), nl.   -> Descomentar futuramente

not_present(_, []).
not_present(PX-PY, [X, Y|Positions]) :-
    ((PX #\= X) #\/ (PY #\= Y)),
    not_present(PX-PY, Positions).

not_overlapping([]).
not_overlapping([PX, PY|Positions]) :-
    not_present(PX-PY, Positions),
    not_overlapping(Positions).

piece(1, 'Pawn').
piece(2, 'Knight').
piece(3, 'King').
piece(4, 'Rook').
piece(5, 'Bishop').
piece(6, 'Queen').

show_results([], _).
show_results([X, Y|Positions], N) :-
    piece(N, Piece),
    write(Piece), write(' is at cell ['), write(X), write(', '), write(Y), write(']'), nl,
    N1 is N + 1,
    show_results(Positions, N1).