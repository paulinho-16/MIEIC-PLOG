inside(X) :- 
    1 =< X, 
    X =< 8.

/**************************************/
pawn_attack(1,1).
pawn_attack(-1,1).

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
/* To Do */
rook_attack(1, 0).
rook_attack(-1, 0).
rook_attack(0, 1).
rook_attack(0, -1).

rook([X, Y], [X1, Y1]) :-
    rook_attack(Distx, Disty), 
    X1 is X+Distx, 
    Y1 is Y+Disty, 
    inside(X1), 
    inside(Y1).

/**************************************/
/* To Do */
bishop([X, Y], [X1, Y1]).

/**************************************/
/* To Do */
queen([X, Y], [X1, Y1]).

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

