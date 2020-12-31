% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Inside                                                              %
%   Prototype:                                                                                                              %
%       inside(+X)                                                                                                          %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       X -> The number that we want to check if it's between the possible row/column values                                %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Checks if the number X is between the possible row/column values (min: 1, max: 8)                                   %
% ------------------------------------------------------------------------------------------------------------------------- %

inside(X) :- 
    1 #=< X, 
    X #=< 8.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Get next cell                                                       %
%   Prototype:                                                                                                              %
%       get_next_cell(+Row-Column, -NextRow-NextColumn)                                                                     %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Row-Column -> The row and column of the current cell we're analysing                                                %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       NextRow-NextColumn -> The row and column of the next cell we'll analyse                                             %
% ------------------------------------------------------------------------------------------------------------------------- %

get_next_cell(Row-Column, NextRow-1) :-
    Column mod 8 =:= 0, !,
    NextRow is Row + Column // 8.
get_next_cell(Row-Column, NextRow-NextColumn) :-
    NextRow is Row + Column // 8,
    NextColumn is Column + 1.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Get Numbered Cells                                                  %
%   Prototype:                                                                                                              %
%       getCellsNumber(+Board, +Row-Column, -Cells)                                                                         %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Board -> The board of a certain problem, with the numbered cells                                                    %
%       Row-Column -> The row and column of the current cell we're analysing. Starts with values 1-1                        %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Cells -> The numbered cells, in the format [Row, Column]                                                            %
% ------------------------------------------------------------------------------------------------------------------------- %

getCellsNumber(_, 9-1, []).
getCellsNumber(GameBoard, Row-Column, [Value-Row-Column|Cells]) :-
    get_value(Row, Column, GameBoard, Value),
    number(Value), !,                       
    get_next_cell(Row-Column, NextRow-NextColumn),
    getCellsNumber(GameBoard, NextRow-NextColumn, Cells).
getCellsNumber(GameBoard, Row-Column, Cells) :-
    get_next_cell(Row-Column, NextRow-NextColumn),
    getCellsNumber(GameBoard, NextRow-NextColumn, Cells).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Not Present                                                         %
%   Prototype:                                                                                                              %
%       not_present(+PX-PY, +Positions)                                                                                     %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       PX-PY -> The row and column of a certain chess piece                                                                %
%       Positions -> The positions of others chess pieces                                                                   %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Adds restrictions to ensure that a piece (PX-PY) is not on the same cell as the pieces in Positions                 %
% ------------------------------------------------------------------------------------------------------------------------- %

not_present(_, []).
not_present(PX-PY, [X, Y|Positions]) :-
    ((PX #\= X) #\/ (PY #\= Y)),
    not_present(PX-PY, Positions).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Not Overlapping                                                     %
%   Prototype:                                                                                                              %
%       not_overlapping(+Positions)                                                                                         %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Positions -> The positions of the chess pieces                                                                      %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Ensures that no chess piece is on the same cell as any other piece                                                  %
% ------------------------------------------------------------------------------------------------------------------------- %

not_overlapping([]).
not_overlapping([PX, PY|Positions]) :-
    not_present(PX-PY, Positions),
    not_overlapping(Positions).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Cell Attacks                                                        %
%   Prototype:                                                                                                              %
%       cell_attacks(-Positions, +Number-Row-Column)                                                                        %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       Number-Row-Column -> The number, row and column of the numbered cell we're analysing                                %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Positions -> The positions of the chess pieces, so that all numbered cells are respected                            %
% ------------------------------------------------------------------------------------------------------------------------- %

cell_attacks([PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], Number-Row-Column) :-
    pawn([PawnX, PawnY], [Row, Column], PawnAttack),
    knight([KnightX, KnightY], [Row, Column], KnightAttack),
    king([KingX, KingY], [Row, Column], KingAttack),
    rook([RookX, RookY], [Row, Column], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], RookAttack),
    bishop([BishopX, BishopY], [Row, Column], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], BishopAttack),
    queen([QueenX, QueenY], [Row, Column], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], QueenAttack),
    PawnAttack + KnightAttack + KingAttack + RookAttack + BishopAttack + QueenAttack #= Number.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Pawn Attack                                                         %
%   Prototype:                                                                                                              %
%       pawn(+[X, Y], +[X1, Y1], -Attack)                                                                                   %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       [X, Y] -> The row and column of the Pawn piece                                                                      %
%       [X1, Y1] -> The row and column of the numbered cell we're analysing                                                 %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Attack -> 1 if the restrictions for the Pawn piece were not broken, 0 otherwise                                     %
% ------------------------------------------------------------------------------------------------------------------------- %

pawn([X, Y], [X1, Y1], Attack) :-
    (X1 #= X - 1 #/\ (Y1 #= Y + 1 #\/ Y1 #= Y - 1)) #<=> Attack.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Knight Attack                                                       %
%   Prototype:                                                                                                              %
%       knight(+[X, Y], +[X1, Y1], -Attack)                                                                                 %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       [X, Y] -> The row and column of the Knight piece                                                                    %
%       [X1, Y1] -> The row and column of the numbered cell we're analysing                                                 %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Attack -> 1 if the restrictions for the Knight piece were not broken, 0 otherwise                                   %
% ------------------------------------------------------------------------------------------------------------------------- %

knight([X, Y], [X1, Y1], Attack) :-
    ((X1 #= X + 2 #/\ Y1 #= Y + 1) #\/ 
    (X1 #= X + 2 #/\ Y1 #= Y - 1) #\/ 
    (X1 #= X - 2 #/\ Y1 #= Y + 1) #\/ 
    (X1 #= X - 2 #/\ Y1 #= Y - 1) #\/ 
    (X1 #= X + 1 #/\ Y1 #= Y + 2) #\/ 
    (X1 #= X + 1 #/\ Y1 #= Y - 2) #\/ 
    (X1 #= X - 1 #/\ Y1 #= Y + 2) #\/ 
    (X1 #= X - 1 #/\ Y1 #= Y - 2)) #<=> Attack.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       King Attack                                                         %
%   Prototype:                                                                                                              %
%       king(+[X, Y], +[X1, Y1], -Attack)                                                                                   %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       [X, Y] -> The row and column of the King piece                                                                      %
%       [X1, Y1] -> The row and column of the numbered cell we're analysing                                                 %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Attack -> 1 if the restrictions for the King piece were not broken, 0 otherwise                                     %
% ------------------------------------------------------------------------------------------------------------------------- %

king([X, Y], [X1, Y1], Attack) :-
    ((X1 #= X - 1 #\/ X1 #= X + 1) #/\ ((Y1 #= Y + 1) #\/ (Y1 #= Y) #\/ (Y1 #= Y - 1))) #\/
    ((X1 #= X) #/\ ((Y1 #= Y + 1) #\/ (Y1 #= Y - 1))) #<=> Attack.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Rook Attack                                                         %
%   Prototype:                                                                                                              %
%       rook(+[X, Y], +[X1, Y1], +OtherPieces, -Attack)                                                                     %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       [X, Y] -> The row and column of the Rook piece                                                                      %
%       [X1, Y1] -> The row and column of the numbered cell we're analysing                                                 %
%       OtherPieces -> The other chess pieces' coordinates                                                                  %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Attack -> 1 if the restrictions for the Rook piece were not broken, 0 otherwise                                     %
% ------------------------------------------------------------------------------------------------------------------------- %

rook([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, _, _, BishopX, BishopY, QueenX, QueenY], Attack) :-

    nothing_between([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, BishopX, BishopY, QueenX, QueenY], [M1, M2, M3, M4, M5]),

    (((X1 #= X) #\/ (Y1 #= Y)) #/\ M1 #/\ M2 #/\ M3 #/\ M4 #/\ M5) #<=> Attack.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Bishop Attack                                                       %
%   Prototype:                                                                                                              %
%       bishop(+[X, Y], +[X1, Y1], +OtherPieces, -Attack)                                                                   %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       [X, Y] -> The row and column of the Bishop piece                                                                    %
%       [X1, Y1] -> The row and column of the numbered cell we're analysing                                                 %
%       OtherPieces -> The other chess pieces' coordinates                                                                  %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Attack -> 1 if the restrictions for the Bishop piece were not broken, 0 otherwise                                   %
% ------------------------------------------------------------------------------------------------------------------------- %

bishop([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, _, _, QueenX, QueenY], Attack) :-
    nothing_between_diagonal([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, QueenX, QueenY], [B1, B2, B3, B4, B5]),

    ((abs(X1 - X) #= abs(Y1 - Y)) #/\ B1 #/\ B2 #/\ B3 #/\ B4 #/\ B5) #<=> Attack.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                                       Queen Attack                                                        %
%   Prototype:                                                                                                              %
%       queen(+[X, Y], +[X1, Y1], +OtherPieces, -Attack)                                                                    %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       [X, Y] -> The row and column of the Queen piece                                                                     %
%       [X1, Y1] -> The row and column of the numbered cell we're analysing                                                 %
%       OtherPieces -> The other chess pieces' coordinates                                                                  %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Attack -> 1 if the restrictions for the Queen piece were not broken, 0 otherwise                                    %
% ------------------------------------------------------------------------------------------------------------------------- %

queen([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, _, _], Attack) :-
    nothing_between([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY], [Q1, Q2, Q3, Q4, Q5]),

    nothing_between_diagonal([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY], [QD1, QD2, QD3, QD4, QD5]),    

    ((((X1 #= X) #\/ (Y1 #= Y)) #/\ Q1 #/\ Q2 #/\ Q3 #/\ Q4 #/\ Q5) #\/ (((abs(X1 - X) #= abs(Y1 - Y)) #/\ QD1 #/\ QD2 #/\ QD3 #/\ QD4 #/\ QD5))) #<=> Attack.

% ------------------------------------------------------------------------------------------------------------------------- %
%                                              Nothing Between (Horizontal and Vertical)                                    %
%   Prototype:                                                                                                              %
%       nothing_between(+[X, Y], +[X1, Y1], +OtherPieces, -Ms)                                                              %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       [X, Y] -> The row and column of the piece we're analysing                                                           %
%       [X1, Y1] -> The row and column of the numbered cell we're analysing                                                 %
%       OtherPieces -> The other chess pieces' coordinates                                                                  %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Ms -> List of booleans, telling if there is no piece between the piece we're analysing ([X, Y])                     %
%             and the numbered cell ([X1, Y1]), in an horizontal or vertical direction                                      %
% ------------------------------------------------------------------------------------------------------------------------- %

nothing_between(_, _, [], []).
nothing_between([X, Y], [X1, Y1], [PX, PY|Positions], [M|Ms]) :-
    (
    ((X #= X1) #/\ (PX #\= X1)) #\/ % Piece not in horizontal
    ((X #= X1) #/\ (PX #= X1) #/\ (Y1 #> Y) #/\ ((PY #< Y) #\/ (PY #> Y1))) #\/ % Check Horizontal Right
    ((X #= X1) #/\ (PX #= X1) #/\ (Y1 #< Y) #/\ ((PY #< Y1) #\/ (PY #> Y))) #\/ % Check Horizontal Left
    ((Y #= Y1) #/\ (PY #\= Y1)) #\/ % Piece not in vertical
    ((Y #= Y1) #/\ (PY #= Y1) #/\ (X1 #> X) #/\ ((PX #< X) #\/ (PX #> X1))) #\/ % Check Vertical Down
    ((Y #= Y1) #/\ (PY #= Y1) #/\ (X1 #< X) #/\ ((PX #< X1) #\/ (PX #> X))) % Check Horizontal Up
    )
    #<=> M,
    nothing_between([X, Y], [X1, Y1], Positions, Ms).

% ------------------------------------------------------------------------------------------------------------------------- %
%                                              Nothing Between (Diagonal)                                                   %
%   Prototype:                                                                                                              %
%       nothing_between_diagonal(+[X, Y], +[X1, Y1], +OtherPieces, -Ms)                                                     %
%                                                                                                                           %
%   Inputs:                                                                                                                 %
%       [X, Y] -> The row and column of the piece we're analysing                                                           %
%       [X1, Y1] -> The row and column of the numbered cell we're analysing                                                 %
%       OtherPieces -> The other chess pieces' coordinates                                                                  %
%                                                                                                                           %
%   Outputs:                                                                                                                %
%       Ms -> List of booleans, telling if there is no piece between the piece we're analysing ([X, Y])                     %
%             and the numbered cell ([X1, Y1]), in a diagonal direction                                                     %
% ------------------------------------------------------------------------------------------------------------------------- %

nothing_between_diagonal(_, _, [], []).
nothing_between_diagonal([X, Y], [X1, Y1], [PX, PY|Positions], [M|Ms]) :-
    (
        ((abs(X1 - X) #= abs(Y1 - Y)) #/\ (abs(X1 - PX) #\= abs(Y1 - PY))) #\/ % Piece not in diagonal
        ((abs(X1 - X) #= abs(Y1 - Y)) #/\ ((X1 #< X) #/\ (Y1 #> Y)) #/\ ((X1 #> PX) #\/ (Y1 #< PY) #\/ (PX #> X) #\/ (PY #< Y))) #\/ % Check Diagonal Top Right
        ((abs(X1 - X) #= abs(Y1 - Y)) #/\ ((X1 #< X) #/\ (Y1 #< Y)) #/\ ((X1 #> PX) #\/ (Y1 #> PY) #\/ (PX #> X) #\/ (PY #> Y))) #\/ % Check Diagonal Top Left
        ((abs(X1 - X) #= abs(Y1 - Y)) #/\ ((X1 #> X) #/\ (Y1 #> Y)) #/\ ((X1 #< PX) #\/ (Y1 #< PY) #\/ (PX #< X) #\/ (PY #< Y))) #\/ % Check Diagonal Bottom Right
        ((abs(X1 - X) #= abs(Y1 - Y)) #/\ ((X1 #> X) #/\ (Y1 #< Y)) #/\ ((X1 #< PX) #\/ (Y1 #> PY) #\/ (PX #< X) #\/ (PY #> Y))) % Check Diagonal Bottom Left
    )
    #<=> M,
    nothing_between_diagonal([X, Y], [X1, Y1], Positions, Ms).