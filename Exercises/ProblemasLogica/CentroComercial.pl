:- use_module(library(clpfd)).

nome(1, 'Adams').
nome(2, 'Baker').
nome(3, 'Catt').
nome(4, 'Dodge').
nome(5, 'Ennis').
nome(6, 'Fisk').

produto(1, 'Livro').
produto(2, 'Vestido').
produto(3, 'Bolsa').
produto(4, 'Gravata').
produto(5, 'Chapeu').
produto(6, 'Candeeiro').

flatten([], []).
flatten([H | T], FlatBoard):-
    flatten(T, NewFlat),
    append(H, NewFlat, FlatBoard).

% centro_comercial -> resolve o problema do centro comercial, com base na informação dada
centro_comercial :-
    Total = [Nomes, Produtos],
    Nomes = [Adams, Baker, Catt, _Dodge, Ennis, Fisk],
    Produtos = [Livro, Vestido, Bolsa, Gravata, _Chapeu, Candeeiro],
    flatten(Total, Flat),
    domain(Produtos, 0, 6),
    all_distinct(Produtos),
    Adams #= 0,
    Catt #= 2, Gravata #< 2, member(Gravata, Nomes),
    Vestido #= 3,
    Candeeiro #= 5,
    Fisk #= 6, member(6, Produtos),
    Bolsa #= 2, Baker #\= Bolsa, Baker #\= Gravata,
    Livro #= 0,
    member(3, Nomes), Ennis #= 5,
    labeling([], Flat),
    escrever(Total, 1).

escrever([[], _], _).
escrever([[Nome|Nomes], Produtos], N) :-
    nome(N, NomeSr),
    element(NElem, Produtos, Nome),
    produto(NElem, Produto),
    N1 is N + 1,
    write('A senhora '), write(NomeSr), write(' comprou '), write(Produto), write(' no piso '), write(Nome), nl,
    escrever([Nomes, Produtos], N1).