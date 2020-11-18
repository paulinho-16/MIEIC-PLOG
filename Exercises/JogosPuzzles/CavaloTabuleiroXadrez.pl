% salto_cavalo(Quad1, Quad2) -> relaciona duas posições consecutivas dum cavalo (Quad1 e Quad2), de acordo com os movimentos possíveis deste
salto_cavalo(X/Y, X1/Y1) :-
    (movimento(Distx, Disty) ; movimento(Disty, Distx)),
    X1 is X + Distx,
    Y1 is Y + Disty,
    dentro_do_tabuleiro(X1),
    dentro_do_tabuleiro(Y1).

movimento(2, 1).
movimento(-2, 1).
movimento(2, -1).
movimento(-2, -1).

dentro_do_tabuleiro(X) :- 1 =< X, X =< 8.

% trajeto_cavalo(Traj) -> Traj é uma lista de pares de coordenadas, que representa um trajeto possível do cavalo num tabuleiro vazio
trajeto_cavalo([_]).
trajeto_cavalo([P1, P2|Traj]) :-
    salto_cavalo(P1, P2),
    trajeto_cavalo([P2|Traj]).

/*
    alínea c):
        trajeto_cavalo([2/1, J1, 5/4, J3, J4x/8]).
*/