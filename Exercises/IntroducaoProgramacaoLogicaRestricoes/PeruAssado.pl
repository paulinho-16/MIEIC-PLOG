:- use_module(library(clpfd)).

% peru(Preco) -> devolve em Preco o preço de cada perú, na época da fatura encontrada, que revelou que 72 perús foram comprados por -67- escudos, sendo o primeiro e último dígito ilegíveis
peru(Preco) :-
    D1 in 1..9,
    D2 in 0..9,
    Preco in 24..134,
    72 * Preco #= D1 * 1000 + 670 + D2,
    labeling([], [D1, D2, Preco]).