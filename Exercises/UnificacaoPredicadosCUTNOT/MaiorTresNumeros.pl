max(X, Y, Z, X):- X>Y, X>Z, !.
max(X, Y, Z, Y):- Y>X, Y>Z, !.
max(_, _, Z, Z).

/*
    alínea a):
        O programa não funciona corretamente quando X é igual a Y e X e Y são maiores que Z.
        Nessa situação, Z é indicado como sendo o maior número. ex: max(6,6,4,X)
*/

max2(X, Y, Z, X) :- X >= Y, X >= Z, !.
max2(_, Y, Z, Y) :- Y >= Z, !.
max2(_, _, Z, Z).