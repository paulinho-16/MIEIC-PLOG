:- use_module(library(clpfd)).

carro(1, 'Amarelo').
carro(2, 'Verde').
carro(3, 'Azul').
carro(4, 'Preto').

% carros -> resolve o problema da fila de carros, com base nas informações dadas
carros :-
    length(Carros, 4), length(Tamanhos, 4),
    domain(Carros, 1, 4), domain(Tamanhos, 1, 4),
    all_distinct(Carros), all_distinct(Tamanhos),
    element(IDAzul, Carros, 3),
    IDAntesAzul #= IDAzul - 1, IDDepoisAzul #= IDAzul + 1,
    element(IDAntesAzul, Tamanhos, TamAntesAzul), element(IDDepoisAzul, Tamanhos, TamDepoisAzul), TamAntesAzul #< TamDepoisAzul,
    element(IDVerde, Carros, 2), element(IDVerde, Tamanhos, 1),
    IDVerde #> IDAzul,
    element(IDAmarelo, Carros, 1), element(IDPreto, Carros, 4), IDAmarelo #> IDPreto,
    append(Carros, Tamanhos, Vars),
    labeling([], Vars),
    write('Ordem da fila de carros: '),
    escrever(Carros).

escrever([Ultimo]) :-
    carro(Ultimo, Cor),
    write(Cor), write('.'), nl.
escrever([Carro|Carros]) :-
    carro(Carro, Cor),
    write(Cor), write(', '),
    escrever(Carros).