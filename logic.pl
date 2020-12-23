inside(X) :- 
    1 #=< X, 
    X #=< 8.

cell_attacks(GameBoard, Row-Column, TimesAtacked) :-
    findall(X, pawn([2, 2], X), CellsAttackedPawn),
    isAttacked([Row, Column], CellsAttackedPawn, PawnAttack),
    findall(X, knight([3, 2], X), CellsAttackedKnight),
    isAttacked([Row, Column], CellsAttackedKnight, KnightAttack),
    findall(X, king([2, 3], X), CellsAttackedKing),
    isAttacked([Row, Column], CellsAttackedKing, KingAttack),
    findall(X, rook(GameBoard, [4, 3], X), CellsAttackedRook),
    isAttacked([Row, Column], CellsAttackedRook, RookAttack),
    % findall(X, bishop(GameBoard, [4, 4], X), CellsAttackedBishop),
    getDiagonalValue_BOTTOM_right(2-4, BR),
    getDiagonalValue_BOTTOM_left(2-4, BL),
    getDiagonalValue_top_right(2-4, TR),
    getDiagonalValue_top_left(2-4, TL),
    append(BR, BL, Bottom),
    append(TR, TL, Top),
    append(Bottom, Top, CellsAttackedBishop),
    isAttacked([Row, Column], CellsAttackedBishop, BishopAttack),

    findall(X, rook(GameBoard, [3, 5], X), QueenVerticalHorizontal),
    getDiagonalValue_BOTTOM_right(3-5, BRQ),
    getDiagonalValue_BOTTOM_left(3-5, BLQ),
    getDiagonalValue_top_right(3-5, TRQ),
    getDiagonalValue_top_left(3-5, TLQ),
    append(BRQ, BLQ, BottomQ),
    append(TRQ, TLQ, TopQ),
    append(BottomQ, TopQ, DiagonalQueen),
    append(QueenVerticalHorizontal, DiagonalQueen, CellsAttackedQueen),
    isAttacked([Row, Column], CellsAttackedQueen, QueenAttack),

    write(PawnAttack), nl,
    write(CellsAttackedPawn), nl,
    write(KnightAttack), nl,
    write(CellsAttackedKnight), nl,
    write(KingAttack), nl,
    write(CellsAttackedKing), nl,
    write(RookAttack), nl,
    write(CellsAttackedRook), nl,
    write(BishopAttack), nl,
    write(CellsAttackedBishop), nl,
    write(QueenAttack), nl,
    write(CellsAttackedQueen), nl,
    TimesAtacked is PawnAttack + KnightAttack + KingAttack + RookAttack + BishopAttack + QueenAttack.

getDiagonalValue_BOTTOM_right(X-Y, [[X1, Y1] | R]) :-
    X1 is X + 1,
    Y1 is Y + 1,
    inside(X1),
    inside(Y1),
    getDiagonalValue_BOTTOM_right(X1-Y1, R), !.
getDiagonalValue_BOTTOM_right(_, []).

getDiagonalValue_BOTTOM_left(X-Y, [[X1, Y1] | R]) :-
    X1 is X + 1,
    Y1 is Y - 1,
    inside(X1),
    inside(Y1),
    getDiagonalValue_BOTTOM_left(X1-Y1, R), !.
getDiagonalValue_BOTTOM_left(_, []).

getDiagonalValue_top_right(X-Y, [[X1, Y1] | R]) :-
    X1 is X - 1,
    Y1 is Y + 1,
    inside(X1),
    inside(Y1),
    getDiagonalValue_top_right(X1-Y1, R), !.
getDiagonalValue_top_right(_, []).

getDiagonalValue_top_left(X-Y, [[X1, Y1] | R]) :-
    X1 is X - 1,
    Y1 is Y - 1,
    inside(X1),
    inside(Y1),
    getDiagonalValue_top_left(X1-Y1, R), !.
getDiagonalValue_top_left(_, []).
    
test :-
    getDiagonalValue_BOTTOM_right(4-4, BR),
    getDiagonalValue_BOTTOM_left(4-4, BL),
    getDiagonalValue_top_right(4-4, TR),
    getDiagonalValue_top_left(4-4, TL),
    append(BR, BL, Bottom),
    append(TR, TL, Top),
    append(Bottom, Top, Diagonal),
    write(Diagonal), nl.

/**************************************/ 

isAttacked(Cell, CellsAttacked, 1) :-
    member(Cell, CellsAttacked), !.
isAttacked(_, _, 0).

/**************************************/

pawn_attack(-1,-1).
pawn_attack(-1, 1).

pawn([X, Y], [X1, Y1]) :-
    pawn_attack(Distx, Disty),
    X1 is X+Distx,
    Y1 is Y+Disty,
    inside(X1), 
    inside(Y1).

/**************************************/

knight_attack(2,1).
knight_attack(2,-1).
knight_attack(-2,-1).
knight_attack(-2,1).

knight_attack(1,2).
knight_attack(1,-2).
knight_attack(-1,2).
knight_attack(-1,-2).

knight([X ,Y], [X1, Y1]) :-  
    knight_attack(Distx, Disty),
    X1 is X+Distx, 
    Y1 is Y+Disty,
    inside(X1),
    inside(Y1).

/**************************************/
rook(GameBoard, [X, Y], [X1, Y1]) :-
    X1 #= X,
    nothing_blocking_tower(GameBoard, X-Y, X1-Y1),
    inside(X1), 
    inside(Y1).
rook(GameBoard, [X, Y], [X1, Y1]) :-
    Y1 #= Y,
    nothing_blocking_tower(GameBoard, X-Y, X1-Y1),
    inside(X1),
    inside(Y1).

nothing_blocking_tower(GameBoard, X-Y, _-Y1) :-
    Y #> Y1,
    nothing_between_row_other(GameBoard, X, Y, Y1).
nothing_blocking_tower(GameBoard, X-Y, _-Y1) :-
    Y1 #> Y,
    nothing_between_row(GameBoard, X, Y, Y1).
nothing_blocking_tower(GameBoard, X-Y, X1-_) :-
    X #> X1,
    nothing_between_column_other(GameBoard, Y, X, X1).
nothing_blocking_tower(GameBoard, X-Y, X1-_) :-
    X1 #> X,
    nothing_between_column(GameBoard, Y, X, X1).

nothing_between_row(_, _, Y, Y).
nothing_between_row(GameBoard, X, Y, Y1) :-
    get_value(X, Y, GameBoard, Value),
    var(Value),
    NewY is Y + 1,
    nothing_between_row(GameBoard, X, NewY, Y1).

nothing_between_row_other(_, _, Y, Y).
nothing_between_row_other(GameBoard, X, Y, Y1) :-
    get_value(X, Y, GameBoard, Value),
    var(Value),
    NewY is Y - 1,
    nothing_between_row_other(GameBoard, X, NewY, Y1).

nothing_between_column(_, _, X, X).
nothing_between_column(GameBoard, Y, X1, X) :-
    get_value(X1, Y, GameBoard, Value),
    var(Value),
    NewX1 is X1 + 1,
    nothing_between_column(GameBoard, Y, NewX1, X).

nothing_between_column_other(_, _, X, X).
nothing_between_column_other(GameBoard, Y, X, X1) :-
    get_value(X, Y, GameBoard, Value),
    var(Value),
    NewX is X - 1,
    nothing_between_column_other(GameBoard, Y, NewX, X1).

/**************************************/


bishop(GameBoard, [X, Y], [X1, Y1]) :-
    domain([X1, Y1], 1, 8),
    X1 #< X,
    nothing_blocking_bishop(GameBoard, X-Y, X1-Y1).
    %inside(X1),
    %inside(Y1).

nothing_blocking_bishop(GameBoard, X-Y, X1-Y1) :-
    %X1 #< X, Y1 #< Y,
    Y1 #< Y,
    nothing_between_diagonal_left_top(GameBoard, X-Y, X1-Y1).
/*
nothing_blocking_bishop(GameBoard, X-Y, X1-Y1) :-
    X1 #> X, Y1 #< Y,
    nothing_between_diagonal_left_bottom(GameBoard, X-Y, X1-Y1).

nothing_blocking_bishop(GameBoard, X-Y, X1-Y1) :-
    X1 #< X, Y1 #> Y,
    nothing_between_diagonal_right_top(GameBoard, X-Y, X1-Y1).

nothing_blocking_bishop(GameBoard, X-Y, X1-Y1) :-
    X1 #> X, Y1 #> Y,
    nothing_between_diagonal_right_bottom(GameBoard, X-Y, X1-Y1).
*/

nothing_between_diagonal_left_top(_, X-Y, X-Y).
nothing_between_diagonal_left_top(GameBoard, X-Y, X1-Y1) :-
    write('[X1,Y1] = '), write(X1 - Y1), nl,
    get_value(X1, Y1, GameBoard, Value),
    var(Value),
    NewX1 is X1 + 1, NewY1 is Y1 + 1,
    nothing_between_diagonal_left_top(GameBoard, X-Y, NewX1-NewY1).

/*
nothing_between_diagonal_left_bottom(_, X-Y, X-Y).
nothing_between_diagonal_left_bottom(GameBoard, X-Y, X1-Y1) :-
    get_value(X1, Y1, GameBoard, Value),
    var(Value),
    NewX1 is X1 - 1, NewY1 is Y1 + 1,
    nothing_between_diagonal_left_bottom(GameBoard, X-Y, NewX1-NewY1).

nothing_between_diagonal_right_top(_, X-Y, X-Y).
nothing_between_diagonal_right_top(GameBoard, X-Y, X1-Y1) :-
    get_value(X1, Y1, GameBoard, Value),
    var(Value),
    NewX1 is X1 + 1, NewY1 is Y1 - 1,
    nothing_between_diagonal_right_top(GameBoard, X-Y, NewX1-NewY1).

nothing_between_diagonal_right_bottom(_, X-Y, X-Y).
nothing_between_diagonal_right_bottom(GameBoard, X-Y, X1-Y1) :-
    get_value(X1, Y1, GameBoard, Value),
    var(Value),
    NewX1 is X1 - 1, NewY1 is Y1 - 1,
    nothing_between_diagonal_right_bottom(GameBoard, X-Y, NewX1-NewY1).
*/
/**************************************/
/* To Do */
% queen([X, Y], [X1, Y1]).

/**************************************/
king_attack(-1, 1).
king_attack(0, 1).
king_attack(1, 1).
king_attack(1, 0).
king_attack(-1, 0).
king_attack(-1, -1).
king_attack(0, -1).
king_attack(1, -1).

king([X, Y], [X1, Y1]) :-
    king_attack(Distx, Disty), 
    X1 is X+Distx, 
    Y1 is Y+Disty, 
    inside(X1), 
    inside(Y1).

/**************************************/



/**************************************/