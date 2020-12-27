problemOne([
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     4, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty,     4, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     4, empty, empty, empty, empty, empty]
]).

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

/*
testPawn([
    [    0, empty,     3, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty,     0, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty]
]).
*/
testPawn([
    [    0, empty,     1, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty]
]).

testAll([
    [    0, empty,     2, empty,     2, empty, empty, empty],
    [empty,     1,     1,     1,     1, empty, empty, empty],
    [empty, empty,     0, empty, empty, empty, empty, empty],
    [    1,     1,     1, empty, empty, empty, empty, empty],
    [    0, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty, empty, empty],
    [    1, empty, 1, 1,  1, empty, 1, 1]
]).

problemPawn(GameBoard) :-
    length(GameBoard, 8),
    build_board(GameBoard),
    put_number(GameBoard, 1, 2, 1),
    put_number(GameBoard, 1, 4, 0).

build_board([]).
build_board([Row|GameBoard]) :-
    length(Row, 8),
    build_board(GameBoard).

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