:- use_module(library(lists)).
:- use_module(library(clpfd)).

:- consult('board.pl').
:- consult('logic.pl').
:- consult('display.pl').

testar(Positions) :-
    %Pieces = [Pawn],
    %problemOne(GameBoard),
    %problemPawn(GameBoard),
    testPawn(GameBoard),

    display_board(GameBoard),
    %cell_attacks(GameBoard, 1-3, TimesAtacked),

    getCellsNumber(GameBoard, 1-1, Cells), !,
    write('Cells: '), write(Cells), nl,

    %Positions = [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY],
    Positions = [PawnX, PawnY, QueenX, QueenY],
    domain(Positions, 1, 8),

    %attack_all_with_number(GameBoard, Cells, Positions),       % [1-1, 1-3]cell_attacks(GameBoard, Row-Column-Number)

    maplist(cell_attacks(GameBoard, Positions), Cells),

    not_overlapping(Positions),

    labeling([], Positions),

    get_value(PawnX, PawnY, GameBoard, empty),
    %get_value(KnightX, KnightY, GameBoard, empty),
    %get_value(KingX, KingY, GameBoard, empty),
    %get_value(RookX, RookY, GameBoard, empty),
    %get_value(BishopX, BishopY, GameBoard, empty),
    get_value(QueenX, QueenY, GameBoard, empty),

    show_results(Positions, 1).     % Solução única, ou pode haver mais do que uma???

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