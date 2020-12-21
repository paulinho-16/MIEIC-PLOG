:- use_module(library(clpfd)).

% puto(Produtos) -> devolve em Produtos o preço de cada produto que o puto comprou quando foi à Mercearia
puto(Produtos) :-
    Produtos = [Arroz, Batatas, Esparguete, Atum],
    domain(Produtos, 1, 711),
    Arroz * Batatas * Esparguete * Atum #= 711000000,
    Arroz + Batatas + Esparguete + Atum #= 711,
    Batatas #> Atum, Atum #> Arroz, Arroz #> Esparguete,
    labeling([], Produtos),
    multiplos(Produtos, 2).

multiplos([], 0).
multiplos([Produto|Produtos], N) :-
    Produto mod 10 =:= 0, !,
    N1 is N - 1,
    multiplos(Produtos, N1).
multiplos([_|Produtos], N) :-
    multiplos(Produtos, N).