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
 
/*attack_all_with_number(_, [], _).
attack_all_with_number(GameBoard, [Cell | Cells], Positions) :-
    write(Cell), nl,
    cell_attacks(GameBoard, Cell, Positions),
    attack_all_with_number(GameBoard, Cells, Positions).*/

percorrer_lista(_, [], ListRestrict, ListRestrict).
percorrer_lista(KingX-KingY, [[X,Y] | CellsAttackedKing], Acc, ListRestrict) :-
    append([(KingX #\= X #\/ KingY #\= Y)], Acc, NewAcc),
    %(KingX #\= X #\/ KingY #\= Y),
    percorrer_lista(KingX-KingY, CellsAttackedKing, NewAcc, ListRestrict).
/*
% [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY]
cell_attacks(GameBoard, [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY], 0-Row-Column) :-
    %write('Para a cell ['), write(Row), write(', '), write(Column), write(']'), nl,
    pawn([Xa, Ya], [Row, Column]),
    findall(Teste, knight(Teste, [Row, Column], 1), CellsAttackedKnight),
    %write(CellsAttackedKnight), nl,
    percorrer_lista(KnightX-KnightY, CellsAttackedKnight, [], Restrictions1),
    findall(ABC, king(ABC, [Row, Column], 1), CellsAttackedKing), 
    %write(CellsAttackedKing), nl,
    percorrer_lista(KingX-KingY, CellsAttackedKing, [], Restrictions2),
    %findall(BCD, rook(GameBoard, BCD, [Row, Column], [PawnX, PawnY, RookX, RookY], 1), CellsAttackedRook), 
    % write(CellsAttackedRook), nl,
    %percorrer_lista(RookX-RookY, CellsAttackedRook, [], Restrictions),
    append(Restrictions1, Restrictions2, Restrictions3),
    append(Restrictions3, [PawnX #\= Xa #\/ PawnY #\= Ya], Restrictions),
    fd_batch(Restrictions), !.
*/

% [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY]
cell_attacks(GameBoard, [PawnX, PawnY, RookX, RookY], Number-Row-Column) :- 
    
    pawn([PawnX, PawnY], [Row, Column], PawnAttack),
    %knight([KnightX, KnightY], [Row, Column], KnightAttack),
    %king([KingX, KingY], [Row, Column], KingAttack),
    rook(GameBoard, [RookX, RookY], [Row, Column], [PawnX, PawnY, RookX, RookY], RookAttack), % , QueenX, QueenY
    %bishop(GameBoard, [BishopX, BishopY], [Row, Column], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], BishopAttack), % , QueenX, QueenY
    %queen(GameBoard, [QueenX, QueenY], [Row, Column], [PawnX, PawnY, KnightX, KnightY, KingX, KingY, RookX, RookY, BishopX, BishopY, QueenX, QueenY], QueenAttack),
    PawnAttack + RookAttack #= Number.
    %PawnAttack + KnightAttack + KingAttack + RookAttack + BishopAttack + QueenAttack #= Number.

pawn([X, Y], [X1, Y1], Attack) :-
    (X1 #= X - 1 #/\ (Y1 #= Y + 1 #\/ Y1 #= Y - 1)) #<=> Attack.

/*
knight_attack(2,1).
knight_attack(2,-1).
knight_attack(-2,-1).
knight_attack(-2,1).

knight_attack(1,2).
knight_attack(1,-2).
knight_attack(-1,2).
knight_attack(-1,-2).
*/

knight([X, Y], [X1, Y1], Attack) :-
    /*
    (((X1 #= X + 2 #\/ X1 #= X - 2) #/\ (Y1 #= Y + 1 #\/ Y1 #= Y - 1)) #\/ 
    ((X1 #= X + 1 #\/ X1 #= X - 1) #/\ (Y1 #= Y + 2 #\/ Y1 #= Y - 2))) #<=> Attack.
    */
    ((X1 #= X + 2 #/\ Y1 #= Y + 1) #\/ 
    (X1 #= X + 2 #/\ Y1 #= Y - 1) #\/ 
    (X1 #= X - 2 #/\ Y1 #= Y + 1) #\/ 
    (X1 #= X - 2 #/\ Y1 #= Y - 1) #\/ 
    (X1 #= X + 1 #/\ Y1 #= Y + 2) #\/ 
    (X1 #= X + 1 #/\ Y1 #= Y - 2) #\/ 
    (X1 #= X - 1 #/\ Y1 #= Y + 2) #\/ 
    (X1 #= X - 1 #/\ Y1 #= Y - 2)) #<=> Attack.
/*
nothing_between([X, Y], [X1, Y1], []).
nothing_between([X, Y], [X1, Y1], [PX, PY|Positions]) :-
    ((((X1 #= X) #/\ (PX #= X) #/\ (PY #< Y)) #/\ (Y1 #> PY)) #\/ 
    (((X1 #= X) #/\ (PX #= X) #/\ (PY #> Y)) #/\ (Y1 #< PY)) #\/
    (((Y1 #= Y) #/\ (PY #= Y) #/\ (PX #< X)) #/\ (X1 #> PX)) #\/
    (((Y1 #= Y) #/\ (PY #= Y) #/\ (PX #> X)) #/\ (X1 #< PX))),
    nothing_between([X, Y], [X1, Y1], Positions).
*/

rook(GameBoard, [X, Y], [X1, Y1], [PawnX, PawnY, RookX, RookY], Attack) :-
    % nothing_between([X, Y], [X1, Y1], Positions),
    (
    % Esquerda
    % Mesma Linha, para a _, com peão na linha, peão à _, tudo até à torre
    ((X1 #= X) #/\ (Y1 #< Y) #/\ (PawnX #= X) #/\ (PawnY #< Y)  #/\ (Y1 #> PawnY)) #\/ 
    % Mesma Linha, para a _, em que o peão está do lado _ ou não está na linha
    ((X1 #= X) #/\ (Y1 #< Y) #/\ ((PawnY #> Y) #\/ (PawnX #\= X))) #\/
    % Direita
    % Mesma Linha, para a _, com peão na linha, peão à _, tudo até à torre
    ((X1 #= X) #/\ (Y1 #> Y) #/\ (PawnX #= X) #/\ (PawnY #> Y)  #/\ (Y1 #< PawnY)) #\/ 
    % Mesma Linha, para a _, em que o peão está do lado _ ou não está na linha
    ((X1 #= X) #/\ (Y1 #> Y) #/\ ((PawnY #< Y) #\/ (PawnX #\= X))) #\/
    (Y1 #= Y)
    
    % Cima
    % Mesma Linha, para a _, com peão na linha, peão à _, tudo até à torre
    %((Y1 #= Y) #/\ (X1 #< X) #/\ (PawnY #= Y) #/\ (PawnX #< X)  #/\ (X1 #> PawnX)) #\/ 
    % Mesma Linha, para a _, sem nada
    %((Y1 #= Y) #/\ (X1 #< X) #/\ (PawnY #\= Y)) 
    /*
    % Baixo
    % Mesma Linha, para a _, com peão na linha, peão à _, tudo até à torre
    ((X1 #= X) #/\ (Y1 #< Y) #/\ (PawnX #= X) #/\ (PawnY #< Y)  #/\ (Y1 #> PawnY)) #\/ 
    % Mesma Linha, para a _, sem nada
    ((X1 #= X) #/\ (Y1 #< Y) #/\ (PawnX #\= X))
    */
    ) #<=> Attack.

bishop(GameBoard, [X, Y], [X1, Y1], Positions, Attack) :-
    (abs(X1 - X) #= abs(Y1 - Y)) #<=> Attack.

queen(GameBoard, [X, Y], [X1, Y1], Positions, Attack) :-
    (((X1 #= X) #\/ (Y1 #= Y)) #\/ (abs(X1 - X) #= abs(Y1 - Y))) #<=> Attack.

king([X, Y], [X1, Y1], Attack) :-
    ((X1 #= X - 1 #\/ X1 #= X + 1) #/\ ((Y1 #= Y + 1) #\/ (Y1 #= Y) #\/ (Y1 #= Y - 1))) #\/
    ((X1 #= X) #/\ ((Y1 #= Y + 1) #\/ (Y1 #= Y - 1))) #<=> Attack.

/*
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
*/
/**************************************/ 
/*
isAttacked(Cell, CellsAttacked, 1) :-
    member(Cell, CellsAttacked), !.
isAttacked(_, _, 0).
*/
/**************************************/

/*pawn([X, Y], [X1, Y1]) :-
    pawn_attack(Distx, Disty),
    X1 #= X+Distx,
    Y1 #= Y+Disty,
    inside(X1), 
    inside(Y1).*/

/**************************************/
/*
knight_attack(2,1).
knight_attack(2,-1).
knight_attack(-2,-1).
knight_attack(-2,1).

knight_attack(1,2).
knight_attack(1,-2).
knight_attack(-1,2).
knight_attack(-1,-2).
*/


/*knight([X ,Y], [X1, Y1], 1) :-  
    knight_attack(Distx, Disty),
    X1 #= X + Distx,
    Y1 #= Y + Disty,
    inside(X1),
    inside(Y1).
knight([X ,Y], [X1, Y1], 0).*/

/**************************************/
/*
rook_attack(0, 1).
rook_attack(0, 2).
rook_attack(0, 3).
rook_attack(0, 4).
rook_attack(0, 5).
rook_attack(0, 6).
rook_attack(0, 7).

rook_attack(0, -1).
rook_attack(0, -2).
rook_attack(0, -3).
rook_attack(0, -4).
rook_attack(0, -5).
rook_attack(0, -6).
rook_attack(0, -7).

rook_attack(1, 0).
rook_attack(2, 0).
rook_attack(3, 0).
rook_attack(4, 0).
rook_attack(5, 0).
rook_attack(6, 0).
rook_attack(7, 0).

rook_attack(-1, 0).
rook_attack(-2, 0).
rook_attack(-3, 0).
rook_attack(-4, 0).
rook_attack(-5, 0).
rook_attack(-6, 0).
rook_attack(-7, 0).
*/
/*rook([X, Y], [X1, Y1], 1) :-
    rook_attack(Distx, Disty),
    X1 #= X + Distx,
    Y1 #= Y + Disty,
    inside(X1),
    inside(Y1).
rook([X, Y], [X1, Y1], 0).*/


    %nothing_blocking_tower_y(Positions, X-Y, X1-Y1),
/*
nothing_blocking_tower_x(Positions, X-Y, X1-Y1) :-
    Y #> Y1,    % torre à direita
    tower_cycle_x_left(Positions, X, Y, Y1).

nothing_blocking_tower_x(Positions, X-Y, X1-Y1) :-
    Y #< Y1,    % torre à esquerda
    tower_cycle_x_right(Positions, X, Y, Y1).

nothing_blocking_tower_y(Positions, X-Y, X1-Y1) :-
    X #> X1, % torre em cima
    tower_cycle_y_up(Positions, Y, X, X1).

nothing_blocking_tower_y(Positions, X-Y, X1-Y1) :-
    X #< X1, % torre em baixo
    tower_cycle_y_down(Positions, Y, X, X1).

tower_cycle_x_left(_, _, Y, Y).
tower_cycle_x_left(Positions, X, Y, Y1) :-
    check_no_piece(Positions, X, Y1),
    NY1 is Y1 + 1,
    tower_cycle_x_left(Positions, X, Y, NY1).

tower_cycle_x_right(_, _, Y, Y).
tower_cycle_x_right(Positions, X, Y, Y1) :-
    check_no_piece(Positions, X, Y1),
    NY1 is Y1 - 1,
    tower_cycle_x_right(Positions, X, Y, NY1).

tower_cycle_y_up(_, _, X, X).
tower_cycle_y_up(Positions, Y, X, X1) :-
    check_no_piece(Positions, X1, Y),
    NX1 is X1 + 1,
    tower_cycle_y_up(Positions, Y, X, NX1).

tower_cycle_y_down(_, _, X, X).
tower_cycle_y_down(Positions, Y, X, X1) :-
    check_no_piece(Positions, X1, Y),
    NX1 is X1 - 1,
    tower_cycle_y_down(Positions, Y, X, NX1).

check_no_piece([], _, _).
check_no_piece([PX, PY|Positions], X, Y) :-
    (PX #\= X #\/ PY #\= Y),
    check_no_piece(Positions, X, Y).
*/
/**************************************/
/*
constrain([]).
constrain([H | RCols]) :-
    safe(H, RCols, 1),
    constrain(RCols).

safe(_, [], _).
safe(X, [Y | T], K) :-
    noattack(X, Y, K),
    K1 is K + 1,
    safe(X, T, K1).

noattack(X, Y, K) :-
    X #\= Y,
    X + K #\= Y,
    X - K #\= Y.
*/
/*diagonal(X-Y, X1-Y1, K) :-
    X #= X1 - K,
    Y #= Y1 - K.
diagonal(X-Y, X1-Y1, K) :-
    X #= X1 + K,
    Y #= Y1 + K.
diagonal(X-Y, X1-Y1, K) :-
    X #= X1 + K,
    Y #= Y1 - K.
diagonal(X-Y, X1-Y1, K) :-
    X #= X1 - K,
    Y #= Y1 + K.*/
/*
diagonal(X-Y, X1-Y1, K) :-
    ((X #= X1 - K) #/\ (Y #= Y1 - K)) #\/ ((X #= X1 + K) #/\ (Y #= Y1 + K)) #\/ ((X #= X1 + K) #/\ (Y #= Y1 - K)) #\/ ((X #= X1 - K) #/\ (Y #= Y1 + K)).

test_shit(List) :-
    List = [X, Y],
    domain(List, 1, 8),
    rook(_, [X, Y], [2, 2], _, 1),
    labeling([], List).
*/

    /*(
    (((X1 #= X - 1) #/\ (Y1 #= Y - 1)) #\/ ((X1 #= X + 1) #/\ (Y1 #= Y + 1)) #\/ ((X1 #= X + 1) #/\ (Y1 #= Y - 1)) #\/ ((X1 #= X - 1) #/\ (Y1 #= Y + 1)))
    #\/
    (((X1 #= X - 2) #/\ (Y1 #= Y - 2)) #\/ ((X1 #= X + 2) #/\ (Y1 #= Y + 2)) #\/ ((X1 #= X + 2) #/\ (Y1 #= Y - 2)) #\/ ((X1 #= X - 2) #/\ (Y1 #= Y + 2)))
    #\/
    (((X1 #= X - 3) #/\ (Y1 #= Y - 3)) #\/ ((X1 #= X + 3) #/\ (Y1 #= Y + 3)) #\/ ((X1 #= X + 3) #/\ (Y1 #= Y - 3)) #\/ ((X1 #= X - 3) #/\ (Y1 #= Y + 3)))
    #\/
    (((X1 #= X - 4) #/\ (Y1 #= Y - 4)) #\/ ((X1 #= X + 4) #/\ (Y1 #= Y + 4)) #\/ ((X1 #= X + 4) #/\ (Y1 #= Y - 4)) #\/ ((X1 #= X - 4) #/\ (Y1 #= Y + 4)))
    #\/
    (((X1 #= X - 5) #/\ (Y1 #= Y - 5)) #\/ ((X1 #= X + 5) #/\ (Y1 #= Y + 5)) #\/ ((X1 #= X + 5) #/\ (Y1 #= Y - 5)) #\/ ((X1 #= X - 5) #/\ (Y1 #= Y + 5)))
    #\/
    (((X1 #= X - 6) #/\ (Y1 #= Y - 6)) #\/ ((X1 #= X + 6) #/\ (Y1 #= Y + 6)) #\/ ((X1 #= X + 6) #/\ (Y1 #= Y - 6)) #\/ ((X1 #= X - 6) #/\ (Y1 #= Y + 6)))
    #\/
    (((X1 #= X - 7) #/\ (Y1 #= Y - 7)) #\/ ((X1 #= X + 7) #/\ (Y1 #= Y + 7)) #\/ ((X1 #= X + 7) #/\ (Y1 #= Y - 7)) #\/ ((X1 #= X - 7) #/\ (Y1 #= Y + 7)))
    #\/
    (((X1 #= X - 8) #/\ (Y1 #= Y - 8)) #\/ ((X1 #= X + 8) #/\ (Y1 #= Y + 8)) #\/ ((X1 #= X + 8) #/\ (Y1 #= Y - 8)) #\/ ((X1 #= X - 8) #/\ (Y1 #= Y + 8)))
    ) */
/*
nothing_blocking_bishop(GameBoard, X-Y, X1-Y1, Positions) :-
    X #> X1, Y #< Y1, % cima direita
    nothing_between_diagonal_right_top(Positions, X-Y, X1-Y1).
nothing_blocking_bishop(GameBoard, X-Y, X1-Y1, Positions) :-
    X #> X1, Y #> Y1, % cima esquerda
    nothing_between_diagonal_left_top(Positions, X-Y, X1-Y1).
nothing_blocking_bishop(GameBoard, X-Y, X1-Y1, Positions) :-
    X #< X1, Y #< Y1, % baixo direita
    nothing_between_diagonal_right_bot(Positions, X-Y, X1-Y1).
nothing_blocking_bishop(GameBoard, X-Y, X1-Y1, Positions) :-
    X #< X1, Y #> Y1, % baixo esquerda
    nothing_between_diagonal_left_bot(Positions, X-Y, X1-Y1).


nothing_between_diagonal_right_top(_, X-Y, X-Y).
nothing_between_diagonal_right_top(Positions, X-Y, X1-Y1) :-
    check_no_piece(Positions, X1, Y1),
    NewX1 #= X1 + 1,
    NewY1 #= Y1 - 1,
    inside(NewX1),
    inside(NewY1),
    nothing_between_diagonal_right_top(Positions, X-Y, NewX1-NewY1).

nothing_between_diagonal_left_top(_, X-Y, X-Y).
nothing_between_diagonal_left_top(Positions, X-Y, X1-Y1) :-
    check_no_piece(Positions, X1, Y1),
    NewX1 #= X1 + 1,
    NewY1 #= Y1 + 1,
    inside(NewX1),
    inside(NewY1),
    nothing_between_diagonal_left_top(Positions, X-Y, NewX1-NewY1).

nothing_between_diagonal_right_bot(_, X-Y, X-Y).
nothing_between_diagonal_right_bot(Positions, X-Y, X1-Y1) :-
    check_no_piece(Positions, X1, Y1),
    NewX1 #= X1 - 1,
    NewY1 #= Y1 - 1,
    inside(NewX1),
    inside(NewY1),
    nothing_between_diagonal_right_bot(Positions, X-Y, NewX1-NewY1).

nothing_between_diagonal_left_bot(_, X-Y, X-Y).
nothing_between_diagonal_left_bot(Positions, X-Y, X1-Y1) :-
    check_no_piece(Positions, X1, Y1),
    NewX1 #= X1 - 1,
    NewY1 #= Y1 + 1,
    inside(NewX1),
    inside(NewY1),
    nothing_between_diagonal_left_bot(Positions, X-Y, NewX1-NewY1).
*/
/*
nothing_between_diagonal_left_top(_, X-Y, X-Y).
nothing_between_diagonal_left_top(GameBoard, X-Y, X1-Y1) :-
    write('[X1,Y1] = '), write(X1 - Y1), nl,
    write('VALUE 6'), nl,
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
/*
king_attack(-1, 1).
king_attack(-1, 0).
king_attack(-1, -1).
king_attack(1, 1).
king_attack(1, 0).
king_attack(1, -1).
king_attack(0, -1).
king_attack(0, 1).
*/
/*king([X, Y], [X1, Y1], 1) :-
    king_attack(Distx, Disty), 
    X1 #= X+Distx, 
    Y1 #= Y+Disty, 
    inside(X1), 
    inside(Y1).
king([X, Y], [X1, Y1], 0).*/



/**************************************/



/**************************************/