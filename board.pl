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

testing([
    [empty,          0,          0, empty, empty,          0, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty,          0],
    [empty, empty, empty, empty, empty, empty, empty,          0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [         0, empty, empty, empty, empty,          4, empty,          0],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty,          0],
    [empty, empty,          0, empty, empty,          0,          0,          1]
]).

testing2([
    [    0, empty, empty,     1, empty, empty,     1, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    1, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty,     2, empty,     1, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty,     0]
]).

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

/* Exemplo Geração dos Boards:
problemOne(GameBoard) :-
    length(GameBoard, 8),
    build_board(GameBoard),
    put_number(GameBoard, 2, 3, 4),
    put_number(GameBoard, 4, 7, 4),
    put_number(GameBoard, 6, 1, 0),
    put_number(GameBoard, 8, 3, 4).

put_number(GameBoard, Row, Column, Elem) :-
    nth1(Row, GameBoard, BoardRow),
    nth1(Column, BoardRow, Position),
    Position #= Elem.
*/

/*problemPawn(GameBoard) :-
    length(GameBoard, 8),
    build_board(GameBoard),
    put_number(GameBoard, 1, 2, 1),
    put_number(GameBoard, 1, 4, 0).

build_board([]).
build_board([Row|GameBoard]) :-
    length(Row, 8),
    build_board(GameBoard).*/

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