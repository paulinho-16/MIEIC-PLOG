:- use_module(library(lists)).
:- use_module(library(clpfd)).

:- consult('board.pl').
:- consult('logic.pl').
:- consult('display.pl').

run(AttackK) :-
    findall(A, knight([3, 2], A), AttackK),
    findall(A, pawn([3, 2], A), AttackK),
    findall(A, rook([3, 2], A), AttackK),
    findall(A, bishop([3, 2], A), AttackK),
    findall(A, queen([3, 2], A), AttackK),
    findall(A, king([3, 2], A), AttackK).

testar(TimesAtacked) :-
    Pieces = [Pawn],
    Positions = [PawnPos],
    %problemOne(GameBoard),
    problemPawn(GameBoard),
    display_board(GameBoard),
    cell_attacks(GameBoard, 1-3, TimesAtacked).