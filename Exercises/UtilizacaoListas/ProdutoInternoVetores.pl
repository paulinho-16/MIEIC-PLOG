% produto_interno(L1, L2, N) -> calcula o produto interno das listas L1 e L2
produto_interno(L1, L2, N) :-
    length(L1, Length1),
    length(L2, Length2),
    Length1 == Length2,
    prod_int(L1, L2, 0, N).

prod_int([], [], N, N).
prod_int([X|L1], [Y|L2], Acc, N) :-
    XY is X * Y,
    NewAcc is Acc + XY,
    prod_int(L1, L2, NewAcc, N).