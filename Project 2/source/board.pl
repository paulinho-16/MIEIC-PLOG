% ------------------------------------------------------------------------------------------------------------------------- %
%                                          Predicate Prototype and Name                                                     %
%   Prototype:                                                                                                              %
%       predicate(+Problem, -Prototype, -Name)                                                                              %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Problem -> The number of the problem that we want the prototype and name                                            %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Prototype -> The prototype of the predicate that returns the board of the problem with number Problem               %
%       Name -> The name of the problem with number Problem                                                                 %
% ------------------------------------------------------------------------------------------------------------------------- %

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

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                   Problem Board                                                           %
%   Prototype:                                                                                                              %
%       problem(-Board, +Dimension)                                                                                         %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Dimension -> The dimension of the board                                                                             %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Board -> The board of the problem requested (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)                                     %
% ------------------------------------------------------------------------------------------------------------------------- %

problemOne([
    [empty,     1, empty,     6, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     2, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty,     0, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty]
], 8).

problemTwo([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     4, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty,     4, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [0    , empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     4, empty, empty, empty, empty, empty]
], 8).

problemThree([
    [     1,     0, empty, empty, empty,     0, empty,    1],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty,     0,     0, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty,     0,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty,     0, empty, empty],
    [empty, empty, empty, empty, empty,     0, empty,     1]
], 8).

problemFour([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     3, empty, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     5, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty,     3, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty]
], 8).

problemFive([
    [empty,     0,     0, empty, empty,     0, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty,     4, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty,     0],
    [empty, empty,     0, empty, empty,     0,     0,     0]
], 8).

problemSix([
    [    0, empty, empty, empty, empty, empty, empty,     0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     1,     1,     1,     1, empty, empty],
    [empty, empty,     1,     1,     1,     1, empty, empty],
    [empty, empty,     1,     1,     1,     1, empty, empty],
    [empty, empty,     1,     1,     1,     1, empty, empty],
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty, empty,     0, empty]
], 8).

problemSeven([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    1,     1,     1,     1,     1,     1,     1,     1],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    1,     1,     1,     2,     2,     1,     1,     2],
    [empty, empty, empty, empty, empty,     2,     1, empty]
], 8).

problemEight([
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [    0,     0, empty, empty, empty, empty, empty, empty],
    [empty,     0,     0, empty, empty, empty, empty, empty],
    [empty, empty,     0,     0, empty, empty, empty, empty],
    [empty, empty, empty,     0,     0, empty, empty, empty],
    [empty, empty, empty, empty,     0,     0, empty, empty],
    [empty, empty,     2, empty, empty,     0,     0, empty],
    [empty, empty, empty, empty, empty, empty,     0,     0]
], 8).

problemNine([
    [empty, empty,     0,     0, empty, empty, empty, empty],
    [empty, empty,     1, empty,     1, empty, empty, empty],
    [empty, empty,     2, empty,     2, empty, empty, empty],
    [empty, empty,     3, empty,     3, empty, empty, empty],
    [empty, empty,     4, empty,     4, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty,     0, empty]
], 8).

problemTen([
    [    0,     0,     0,     0,     0,     0,     0,     0],
    [    1,     1,     1,     1,     1,     1,     1,     1],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    1, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     2, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     3, empty, empty, empty]
], 8).

problemEleven([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     2, empty, empty, empty,     3, empty],
    [empty, empty, empty,     2, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty,     3, empty, empty, empty, empty,     3, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     3, empty, empty, empty],
    [empty, empty,     1, empty, empty, empty, empty, empty]
], 8).

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

    % ProblemFour Solution: (Time Taken: 6 sec)
    /*PawnX #= 2, PawnY #= 2,
    KnightX #= 4, KnightY #= 7,
    KingX #= 7, KingY #= 8,
    RookX #= 2, RookY #= 7,
    BishopX #= 3, BishopY #= 8,
    QueenX #= 2, QueenY #= 8,*/

    % ProblemFive Solution: (Time Taken: 1 hour)
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

    % ProblemNine Solution: (Time Taken: 43 sec)
    /*PawnX #= 6, PawnY #= 4,
    KnightX #= 3, KnightY #= 1,
    KingX #= 4, KingY #= 4,
    RookX #= 6, RookY #= 5,
    BishopX #= 4, BishopY #= 2,
    QueenX #= 5, QueenY #= 4,*/

    % ProblemTen Solution: (Time Taken: 10 min)
    /*PawnX #= 3, PawnY #= 6,
    KnightX #= 4, KnightY #= 7,
    KingX #= 3, KingY #= 3,
    RookX #= 8, RookY #= 3,
    BishopX #= 7, BishopY #= 6,
    QueenX #= 6, QueenY #= 3,*/

    % ProblemEleven Solution: (Time Taken: 6 sec)
    /*PawnX #= 6, PawnY #= 1,
    KnightX #= 1, KnightY #= 5,
    KingX #= 6, KingY #= 6,
    RookX #= 7, RookY #= 7,
    BishopX #= 1, BishopY #= 6,
    QueenX #= 5, QueenY #= 3,*/

% ------------------------------------------------------------------------------------------------------------------------------------------------------------

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                   Board Size                                                              %
%   Prototype:                                                                                                              %
%       size_board(+Problem, -Size)                                                                                         %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Problem -> The name of the problem chosen by the user                                                               %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Size -> The size of the board                                                                                       %
% ------------------------------------------------------------------------------------------------------------------------- %

size_board('Random Problem', Size) :-
    nl, write('Dimension of board? '), nl, nl,
    input(Size, 6, 12, 'Dimension of board? (between 6 and 12) ', dimensions).
size_board(_, 8).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                   Random Problem Board                                                    %
%   Prototype:                                                                                                              %
%       randomProblem(-Board, +Size)                                                                                        %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Size -> The size of the board                                                                                       %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Board -> A random board, with numbered cells generated randomly                                                     %
% ------------------------------------------------------------------------------------------------------------------------- %

randomProblem(GameBoard, Size) :-
    length(GameBoard, Size),
    build_board(GameBoard, Size),
    random(3, 8, NumberedCells), !,
    fill_board(GameBoard, NumberedCells, [], Size).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                          Build Board                                                                      %
%   Prototype:                                                                                                              %
%       build_board(+Board, +Size)                                                                                          %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Board -> The board before defining the size of its sublists                                                         %
%       Size -> The size of the board                                                                                       %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Defines the length of the sublists containing the board Board                                                       %
% ------------------------------------------------------------------------------------------------------------------------- %

build_board([], _).
build_board([Row|GameBoard], Size) :-
    length(Row, Size),
    build_board(GameBoard, Size).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                          Put Number                                                                       %
%   Prototype:                                                                                                              %
%       put_number(+Board, +Row, +Column, +Number)                                                                          %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Board -> The board of the game                                                                                      %
%       Row -> The row of the cell we want to fill with a number                                                            %
%       Column -> The column of the cell we want to fill with a number                                                      %
%       Number -> The number that we want to put on the cell with row Row and column Column on the board Board              %
%   Outputs:                                                                                                                %
%       Fills the cell with row Row and column Column on the board Board, with the number Number                            %
% ------------------------------------------------------------------------------------------------------------------------- %

put_number(GameBoard, Row, Column, Elem) :-
    nth1(Row, GameBoard, BoardRow),
    nth1(Column, BoardRow, Position),
    Position #= Elem.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                        Fill Board                                                         %
%   Prototype:                                                                                                              %
%       fill_board(+Board, +NumberedCells, +Cells, +Size)                                                                   %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Board -> The board to fill with numbered cells                                                                      %
%       NumberedCells -> The number of numbered cells we want the board Board to have                                       %
%       Cells -> The numbered cells of the board in the format [Row, Column]. Starts empty ([])                             %
%       Size -> The size of the board                                                                                       %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Value -> The value of the Cell with row Row and column Column in the CurrentBoard. If the cell is not valid,        %
% ------------------------------------------------------------------------------------------------------------------------- %

fill_board(_, 0, _, _).
fill_board(GameBoard, NumberedCells, Cells, Size) :-
    SizePlus is Size + 1,
    repeat,
        random(1, SizePlus, Row), random(1, SizePlus, Column),
        NewNumberedCells is NumberedCells - 1,
        \+ member([Row, Column], Cells),
    random(1, 6, Value),
    put_number(GameBoard, Row, Column, Value),
    fill_board(GameBoard, NewNumberedCells, [[Row, Column]|Cells], Size).

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

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                     Replace Cell Value                                                    %
%   Prototype:                                                                                                              %
%       replace(+OriginalList, +Index, +Element, -NewList)                                                                  %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       OriginalList -> The List to have one of its values replaced                                                         %
%       Index -> The index of the element to be replaced in the OriginalList                                                %
%       Element -> The new value to replace the element at the index Index of the OriginalList                              %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       NewList -> The resulting list, after replacing the element at the index Index for the value Element                 %
% ------------------------------------------------------------------------------------------------------------------------- %

replace([_|T], 1, X, [X|T]):- !.
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                        Display Solution                                                   %
%   Prototype:                                                                                                              %
%       display_solution(+Board, +Positions)                                                                                %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Board -> The board with the numbered cells                                                                          %
%       Positions -> The positions of the chess pieces                                                                      %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Displays the board with the numbered cells and the pieces placed on it, presenting the solution of the problem      %
% ------------------------------------------------------------------------------------------------------------------------- %

display_solution(GameBoard, Positions) :-
    add_pieces(GameBoard, Positions, GameBoardPieces),
    display_board(GameBoardPieces), nl,
    write('P - Pawn, N - Knight, K - King, R - Rook, B - Bishop, Q - Queen'), nl, nl.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                     Add Pieces                                                            %
%   Prototype:                                                                                                              %
%       add_pieces(+Board, +Positions, -NewBoard)                                                                           %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Board -> The board with the numbered cells, before placing the pieces                                               %
%       Positions -> The positions of the chess pieces, in the solution of the problem                                      %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       NewBoard -> The resulting board, after placing the chess pieces of the solution of the problem                      %
% ------------------------------------------------------------------------------------------------------------------------- %

add_pieces(GameBoard, [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], GameBoardPieces) :-
    replace_value(GameBoard, PawnX, PawnY, pawn, PawnBoard),
    replace_value(PawnBoard, KnightX, KnightY, knight, KnightBoard),
    replace_value(KnightBoard, KingX, KingY, king, KingBoard),
    replace_value(KingBoard, RookX, RookY, rook, RookBoard),
    replace_value(RookBoard, BishopX, BishopY, bishop, BishopBoard),
    replace_value(BishopBoard, QueenX, QueenY, queen, GameBoardPieces).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                     Replace Value                                                         %
%   Prototype:                                                                                                              %
%       replace_value(+Board, +Row, +Column, +Value, -NewBoard)                                                             %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Board -> The board before replacing the value                                                                       %
%       Row -> The row of the cell that we want to replace the value                                                        %
%       Column -> The column of the cell that we want to replace the value                                                  %
%       Value -> The new value of the cell with row Row and column Column                                                   %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       NewBoard -> The resulting board, after replacing the value of the cell with row Row and column Column               %
% ------------------------------------------------------------------------------------------------------------------------- %

replace_value(GameBoard, Row, Column, Value, NewGameBoard) :-
    nth1(Row, GameBoard, RowBeforeReplace),
    replace(RowBeforeReplace, Column, Value, RowAfterReplace),
    replace(GameBoard, Row, RowAfterReplace, NewGameBoard).