:- use_module(library(lists)).
:- use_module(library(clpfd)).

:- consult('board.pl').
:- consult('logic.pl').
:- consult('display.pl').

testar(Positions) :-
    %Pieces = [Pawn],
    %problemOne(GameBoard),
    %problemPawn(GameBoard),
    testAll(GameBoard),

    display_board(GameBoard),
    %cell_attacks(GameBoard, 1-3, TimesAtacked),

    getCellsNumber(GameBoard, 1-1, Cells), !,
    write('Cells: '), write(Cells), nl,

    Positions = [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY],
    % Positions = [PawnX, PawnY],
    domain(Positions, 1, 8),

    %attack_all_with_number(GameBoard, Cells, Positions),       % [1-1, 1-3]cell_attacks(GameBoard, Row-Column-Number)

    maplist(cell_attacks(GameBoard, Positions), Cells),

    labeling([], Positions),

    get_value(PawnX, PawnY, GameBoard, empty),
    get_value(KnightX, KnightY, GameBoard, empty),
    get_value(KingX, KingY, GameBoard, empty),
    get_value(RookX, RookY, GameBoard, empty),

    /*\+ (PawnX #= KnightX, PawnY #= KnightY),
    \+ (PawnX #= KingX, PawnY #= KingY),
    \+ (KnightX #= KingX, KnightY #= KingY),*/

    show_results(Positions, 1).     % Solução única, ou pode haver mais do que uma???

piece(1, 'Pawn').
piece(2, 'Knight').
piece(3, 'King').
piece(4, 'Rook').

show_results([], _).
show_results([X, Y|Positions], N) :-
    piece(N, Piece),
    write(Piece), write(' is at cell ['), write(X), write(', '), write(Y), write(']'), nl,
    N1 is N + 1,
    show_results(Positions, N1).