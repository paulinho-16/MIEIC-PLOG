predicate(1, problemOne, 'Problem 1').
predicate(2, problemTwo, 'Problem 2').
predicate(3, problemThree, 'Problem 3').
predicate(4, problemFour, 'Problem 4').
predicate(5, problemFive, 'Problem 5').
predicate(6, problemSix, 'Problem 6').
predicate(7, problemSeven, 'Problem 7').
predicate(8, problemEight, 'Problem 8').
predicate(9, problemNine, 'Problem 9').
predicate(10, problemTen, 'Problem 10').
predicate(11, problemEleven, 'Problem 11').
predicate(12, randomProblem, 'Random Problem').

problemOne([
    [empty,     1, empty,     6, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     2, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty,     0, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty]
]).

problemTwo([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     4, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty,     4, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [0    , empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     4, empty, empty, empty, empty, empty]
]).

problemThree([
    [     1,     0, empty, empty, empty,     0, empty,    1],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty,     0,     0, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty,     0,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty,     0, empty, empty],
    [empty, empty, empty, empty, empty,     0, empty,     1]
]).

problemFour([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     3, empty, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     5, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty,     3, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty]
    ]).

problemFive([
    [empty,     0,     0, empty, empty,     0, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty,     4, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty,     0],
    [empty, empty,     0, empty, empty,     0,     0,     0]
    ]).

problemSix([
    [    0, empty, empty, empty, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     1,     1,     1,     1, empty, empty],
    [empty, empty,     1,     1,     1,     1, empty, empty],
    [empty, empty,     1,     1,     1,     1, empty, empty],
    [empty, empty,     1,     1,     1,     1, empty, empty],
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty, empty,     0, empty]
    ]).

problemSeven([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    1,     1,     1,     1,     1,     1,     1,     1],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    1,     1,     1,     2,     2,     1,     1,     2],
    [empty, empty, empty, empty, empty,     2,     1, empty]
    ]).

problemEight([
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [    0,     0, empty, empty, empty, empty, empty, empty],
    [empty,     0,     0, empty, empty, empty, empty, empty],
    [empty, empty,     0,     0, empty, empty, empty, empty],
    [empty, empty, empty,     0,     0, empty, empty, empty],
    [empty, empty, empty, empty,     0,     0, empty, empty],
    [empty, empty,     2, empty, empty,     0,     0, empty],
    [empty, empty, empty, empty, empty, empty,     0,     0]
    ]).

problemNine([
    [empty, empty,     0,     0, empty, empty, empty, empty],
    [empty, empty,     1, empty,     1, empty, empty, empty],
    [empty, empty,     2, empty,     2, empty, empty, empty],
    [empty, empty,     3, empty,     3, empty, empty, empty],
    [empty, empty,     4, empty,     4, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty,     0, empty]
    ]).

problemTen([
    [    0,     0,     0,     0,     0,     0,     0,     0],
    [    1,     1,     1,     1,     1,     1,     1,     1],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    1, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     2, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     3, empty, empty, empty]
    ]).

problemEleven([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     2, empty, empty, empty,     3, empty],
    [empty, empty, empty,     2, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty,     3, empty, empty, empty, empty,     3, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     3, empty, empty, empty],
    [empty, empty,     1, empty, empty, empty, empty, empty]
    ]).

% -------------------------------------------------------------------- Problems Solutions --------------------------------------------------------------------

    % ProblemOne Solution: (Time Taken: 0 sec)
    /*PawnX #= 2, PawnY #= 5,
    KnightX #= 2, KnightY #= 2,
    KingX #= 2, KingY #= 4,
    RookX #= 1, RookY #= 3,
    BishopX #= 4, BishopY #= 1,
    QueenX #= 1, QueenY #= 7,*/

    % ProblemTwo Solution: (Time Taken: 0 sec)
    /*PawnX #= 3, PawnY #= 2,
    KnightX #= 3, KnightY #= 5,
    KingX #= 8, KingY #= 2,
    RookX #= 4, RookY #= 3,
    BishopX #= 5, BishopY #= 6,
    QueenX #= 8, QueenY #= 7,*/

    % ProblemThree Solution: Works, but takes a lot of time...
    /*PawnX #= 2, PawnY #= 2,
    KnightX #= 4, KnightY #= 7,
    KingX #= 7, KingY #= 8,
    RookX #= 2, RookY #= 7,
    BishopX #= 3, BishopY #= 8,
    QueenX #= 2, QueenY #= 8,*/

    % ProblemFour Solution: (Time Taken: 2 sec)
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

% ------------------------------------------------------------------------------------------------------------------------------------------------------------

randomProblem(GameBoard) :-
    length(GameBoard, 8),
    build_board(GameBoard),
    random(3, 8, NumberedCells), !,
    fill_board(GameBoard, NumberedCells, []).

build_board([]).
build_board([Row|GameBoard]) :-
    length(Row, 8),
    build_board(GameBoard).

put_number(GameBoard, Row, Column, Elem) :-
    nth1(Row, GameBoard, BoardRow),
    nth1(Column, BoardRow, Position),
    Position #= Elem.

fill_board(_, 0, _).
fill_board(GameBoard, NumberedCells, Cells) :-
    repeat,
        random(1, 9, Row), random(1, 9, Column),
        NewNumberedCells is NumberedCells - 1,
        \+ member([Row, Column], Cells),
    random(1, 6, Value),
    put_number(GameBoard, Row, Column, Value),
    fill_board(GameBoard, NewNumberedCells, [[Row, Column]|Cells]).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                        Get Cell Value                                                     %
%   Prototype:                                                                                                              %
%       get_value(+Row, +Column, +CurrentBoard, -Value)                                                                     %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Row -> The Row of the Cell which we want to know the value                                                          %
%       Column -> The Column of the Cell which we want to know the value                                                    %
%       CurrentBoard -> The state of the current board                                                                      %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Value -> The value of the Cell with row Row and column Column in the CurrentBoard. If the cell is not valid,        %
%                return value off_limits                                                                                    %
% ------------------------------------------------------------------------------------------------------------------------- %

get_value(Row, Column, CurrentBoard, Value) :-
    nth1(Row, CurrentBoard, RowList),
    nth1(Column, RowList, Value), !.

get_value(_, _, _, off_limits).