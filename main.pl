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
    
    %Predicate =.. [PredicateName, GameBoard],

    %Predicate,

    problemEleven(GameBoard),

    nl, nl, write('\t\t'), write(Problem),
    nl, nl, display_board(GameBoard),

    getCellsNumber(GameBoard, 1-1, Cells), !,
    nl, write('Cells: '), write(Cells), nl,

    %Positions = [PawnX, PawnY, KnightX, KnightY, BishopX, BishopY],
    Positions = [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY],
    domain(Positions, 1, 8),

    % ProblemThree Solution: Works, but takes a lot of time...
    /*PawnX #= 2, PawnY #= 2,
    KnightX #= 4, KnightY #= 7,
    KingX #= 7, KingY #= 8,
    RookX #= 2, RookY #= 7,
    BishopX #= 3, BishopY #= 8,
    QueenX #= 2, QueenY #= 8,*/

    % ProblemFive Solution: Works, but takes a lot of time...
    /*PawnX #= 6, PawnY #= 5,
    KnightX #= 4, KnightY #= 8,
    KingX #= 6, KingY #= 6,
    RookX #= 4, RookY #= 6,
    BishopX #= 2, BishopY #= 6,
    QueenX #= 4, QueenY #= 4,*/

    % ProblemSix Solution: Works, but takes a lot of time...
    /*PawnX #= 7, PawnY #= 3,
    KnightX #= 8, KnightY #= 4,
    KingX #= 2, KingY #= 4,
    RookX #= 4, RookY #= 2,
    BishopX #= 4, BishopY #= 8,
    QueenX #= 5, QueenY #= 8,*/

    % ProblemSeven Solution: Works, but takes a lot of time...
    /*PawnX #= 8, PawnY #= 4,
    KnightX #= 1, KnightY #= 3,
    KingX #= 8, KingY #= 5,
    RookX #= 8, RookY #= 8,
    BishopX #= 4, BishopY #= 5,
    QueenX #= 4, QueenY #= 4,*/

    % ProblemEight Solution: Works, but takes a lot of time...
    /*PawnX #= 8, PawnY #= 4,
    KnightX #= 7, KnightY #= 2,
    KingX #= 6, KingY #= 2,
    RookX #= 8, RookY #= 2,
    BishopX #= 7, BishopY #= 1,
    QueenX #= 8, QueenY #= 1,*/

    % ProblemNine Solution: Works, but takes a lot of time...
    /*PawnX #= 6, PawnY #= 4,
    KnightX #= 3, KnightY #= 1,
    KingX #= 4, KingY #= 4,
    RookX #= 6, RookY #= 5,
    BishopX #= 4, BishopY #= 2,
    QueenX #= 5, QueenY #= 4,*/

    % ProblemTen Solution: Works, but takes a lot of time...
    /*PawnX #= 3, PawnY #= 6,
    KnightX #= 4, KnightY #= 7,
    KingX #= 3, KingY #= 3,
    RookX #= 8, RookY #= 3,
    BishopX #= 7, BishopY #= 6,
    QueenX #= 6, QueenY #= 3,*/

    % ProblemEleven Solution: Works, but takes a lot of time...
    /*PawnX #= 6, PawnY #= 1,
    KnightX #= 1, KnightY #= 5,
    KingX #= 6, KingY #= 6,
    RookX #= 7, RookY #= 7,
    BishopX #= 1, BishopY #= 6,
    QueenX #= 5, QueenY #= 3,*/

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