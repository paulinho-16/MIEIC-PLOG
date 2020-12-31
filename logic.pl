inside(X) :- 
    1 #=< X, 
    X #=< 8.

get_next_cell(Row-Column, NextRow-1) :-
    Column mod 8 =:= 0, !,
    NextRow is Row + Column // 8.
get_next_cell(Row-Column, NextRow-NextColumn) :-
    NextRow is Row + Column // 8,
    NextColumn is Column + 1.

getCellsNumber(GameBoard, 9-1, []).
getCellsNumber(GameBoard, Row-Column, [Value-Row-Column|Cells]) :-
    get_value(Row, Column, GameBoard, Value),
    number(Value), !,                       
    get_next_cell(Row-Column, NextRow-NextColumn),
    getCellsNumber(GameBoard, NextRow-NextColumn, Cells).
getCellsNumber(GameBoard, Row-Column, Cells) :-
    get_next_cell(Row-Column, NextRow-NextColumn),
    getCellsNumber(GameBoard, NextRow-NextColumn, Cells).

cell_attacks(GameBoard, [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], Number-Row-Column) :- 
    pawn([PawnX, PawnY], [Row, Column], PawnAttack),
    knight([KnightX, KnightY], [Row, Column], KnightAttack),
    king([KingX, KingY], [Row, Column], KingAttack),
    rook(GameBoard, [RookX, RookY], [Row, Column], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], RookAttack),
    bishop(GameBoard, [BishopX, BishopY], [Row, Column], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], BishopAttack),
    queen(GameBoard, [QueenX, QueenY], [Row, Column], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], QueenAttack),
    PawnAttack + KnightAttack + KingAttack + RookAttack + BishopAttack + QueenAttack #= Number.

pawn([X, Y], [X1, Y1], Attack) :-
    (X1 #= X - 1 #/\ (Y1 #= Y + 1 #\/ Y1 #= Y - 1)) #<=> Attack.

knight([X, Y], [X1, Y1], Attack) :-
    ((X1 #= X + 2 #/\ Y1 #= Y + 1) #\/ 
    (X1 #= X + 2 #/\ Y1 #= Y - 1) #\/ 
    (X1 #= X - 2 #/\ Y1 #= Y + 1) #\/ 
    (X1 #= X - 2 #/\ Y1 #= Y - 1) #\/ 
    (X1 #= X + 1 #/\ Y1 #= Y + 2) #\/ 
    (X1 #= X + 1 #/\ Y1 #= Y - 2) #\/ 
    (X1 #= X - 1 #/\ Y1 #= Y + 2) #\/ 
    (X1 #= X - 1 #/\ Y1 #= Y - 2)) #<=> Attack.

king([X, Y], [X1, Y1], Attack) :-
    ((X1 #= X - 1 #\/ X1 #= X + 1) #/\ ((Y1 #= Y + 1) #\/ (Y1 #= Y) #\/ (Y1 #= Y - 1))) #\/
    ((X1 #= X) #/\ ((Y1 #= Y + 1) #\/ (Y1 #= Y - 1))) #<=> Attack.

rook(GameBoard, [X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], Attack) :-

    nothing_between([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, BishopX, BishopY, QueenX, QueenY], [M1, M2, M3, M4, M5]),

    (((X1 #= X) #\/ (Y1 #= Y)) #/\ M1 #/\ M2 #/\ M3 #/\ M4 #/\ M5) #<=> Attack.

bishop(GameBoard, [X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], Attack) :-
    nothing_between_diagonal([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, QueenX, QueenY], [B1, B2, B3, B4, B5]),

    ((abs(X1 - X) #= abs(Y1 - Y)) #/\ B1 #/\ B2 #/\ B3 #/\ B4 #/\ B5) #<=> Attack.

queen(GameBoard, [X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], Attack) :-
    nothing_between([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY], [Q1, Q2, Q3, Q4, Q5]),

    nothing_between_diagonal([X, Y], [X1, Y1], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY], [QD1, QD2, QD3, QD4, QD5]),    

    ((((X1 #= X) #\/ (Y1 #= Y)) #/\ Q1 #/\ Q2 #/\ Q3 #/\ Q4 #/\ Q5) #\/ (((abs(X1 - X) #= abs(Y1 - Y)) #/\ QD1 #/\ QD2 #/\ QD3 #/\ QD4 #/\ QD5))) #<=> Attack.

nothing_between([X, Y], [X1, Y1], [], []).
nothing_between([X, Y], [X1, Y1], [PX, PY|Positions], [M|Ms]) :-
    (
    ((X #= X1) #/\ (PX #\= X1)) #\/
    ((X #= X1) #/\ (PX #= X1) #/\ (Y1 #> Y) #/\ ((PY #< Y) #\/ (PY #> Y1))) #\/
    ((X #= X1) #/\ (PX #= X1) #/\ (Y1 #< Y) #/\ ((PY #< Y1) #\/ (PY #> Y))) #\/
    ((Y #= Y1) #/\ (PY #\= Y1)) #\/
    ((Y #= Y1) #/\ (PY #= Y1) #/\ (X1 #> X) #/\ ((PX #< X) #\/ (PX #> X1))) #\/
    ((Y #= Y1) #/\ (PY #= Y1) #/\ (X1 #< X) #/\ ((PX #< X1) #\/ (PX #> X)))
    )
    #<=> M,
    nothing_between([X, Y], [X1, Y1], Positions, Ms).

nothing_between_diagonal([X, Y], [X1, Y1], [], []).
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