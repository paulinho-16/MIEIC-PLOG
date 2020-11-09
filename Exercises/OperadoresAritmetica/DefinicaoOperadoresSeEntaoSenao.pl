% Precedência de ">" é 700, logo a precedência destes operadores deve ser maior, para que o > seja efetuado primeiro
:- op(900, fx, se).
:- op(850, xfx, entao).
:- op(800, xfx, senao).
:- op(750, xfx, :=).

se V1>V2 entao Var := V3 senao Var := _ :- V1 > V2, Var = V3, !.
se _>_ entao Var := _ senao Var := V4 :- Var = V4.

/*
    Código do exemplo:

    X=2, Y=3, V2 is 2*X, V4 is 4*X, se Y>V2 entao Z:=Y senao Z:=V4, se Z>5 entao W:=1 senao W:=0.
*/