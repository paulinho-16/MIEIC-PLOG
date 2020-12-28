:- use_module(library(clpfd)).

nome(1, 'Paula').
nome(2, 'Artur').
nome(3, 'Ema').
nome(4, 'Daniel').
nome(5, 'Outro').

sobrenome(1, 'Mala.').
sobrenome(2, 'Postal.').
sobrenome(3, 'Bola.').
sobrenome(4, 'Famoso.').
sobrenome(5, 'Outro.').

endereco(1, 'Rua Espanha.').
endereco(2, 'Rua Turquia.').
endereco(3, 'Rua Primavera.').
endereco(4, 'Rua Hungria.').
endereco(5, 'Rua Sardenha.').

encomenda(1, 'roupas de crianca.').
encomenda(2, 'catalogo de vendas.').
encomenda(3, 'plantas.').
encomenda(4, 'livro.').
encomenda(5, 'outra coisa.').

flatten([], []).
flatten([H | T], FlatBoard):-
    flatten(T, NewFlat),
    append(H, NewFlat, FlatBoard).

% entrega -> resolve o problema da entrega rápida, com base na informação dada
% Há falta de informação, daí existirem várias hipóteses que cumpram os requisitos do enunciado
entrega :-
    Total = [Sobrenomes, Enderecos, Encomendas],
    Sobrenomes = [Mala, Postal, Bola, Famoso, _Outro],
    Enderecos = [RuaEspanha, RuaTurquia, RuaPrimavera, RuaHungria, RuaSardenha],
    Encomendas = [RoupasCrianca, CatalogoVendas, Plantas, Livro, _OutraCoisa],
    domain(Sobrenomes, 1, 5), domain(Enderecos, 1, 5), domain(Encomendas, 1, 5),
    all_distinct(Sobrenomes), all_distinct(Enderecos), all_distinct(Encomendas),
    Mala #= RoupasCrianca,
    Postal #= 1, RuaEspanha #\= 1, RuaEspanha #\= Bola, CatalogoVendas #\= 1, CatalogoVendas #\= 2,
    RuaTurquia #\= Plantas,
    RuaPrimavera #= 3,
    RuaHungria #\= Bola, RuaHungria #= Livro,
    Plantas #\= Famoso, Famoso #= RuaSardenha, Famoso #\= 4,
    flatten(Total, FlatTotal),
    labeling([], FlatTotal),
    escrever_sobrenomes(Sobrenomes, 1), nl,
    escrever_enderecos(Enderecos, 1), nl,
    escrever_encomendas(Encomendas, 1).

escrever_sobrenomes([], _).
escrever_sobrenomes([Sobrenome|Sobrenomes], N) :-
    nome(Sobrenome, Nome),
    sobrenome(N, NomeSobrenome),
    write(Nome), write(' tem sobrenome '), write(NomeSobrenome), nl,
    N1 is N + 1,
    escrever_sobrenomes(Sobrenomes, N1).

escrever_enderecos([], _).
escrever_enderecos([Endereco|Enderecos], N) :-
    nome(Endereco, Nome),
    endereco(N, NomeEndereco),
    write(Nome), write(' vive na '), write(NomeEndereco), nl,
    N1 is N + 1,
    escrever_enderecos(Enderecos, N1).

escrever_encomendas([], _).
escrever_encomendas([Encomenda|Encomendas], N) :-
    nome(Encomenda, Nome),
    encomenda(N, NomeEncomenda),
    write(Nome), write(' encomendou '), write(NomeEncomenda), nl,
    N1 is N + 1,
    escrever_encomendas(Encomendas, N1).