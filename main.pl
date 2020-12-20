:- consult('board.pl').
:- consult('logic.pl').


run(AttackK) :-
    findall(A, knight([3, 2], A), AttackK),
    findall(A, pawn([3, 2], A), AttackK),
    findall(A, rook([3, 2], A), AttackK),
    findall(A, bishop([3, 2], A), AttackK),
    findall(A, queen([3, 2], A), AttackK),
    findall(A, king([3, 2], A), AttackK).