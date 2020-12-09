/*
    alínea a):
        Um estado de um tabuleiro de Xadrez poderia ser representado por uma lista de listas, de forma
        a representar uma matriz 8x8. As casas vazias poderiam ser representadas pelo número 0, por exemplo,
        e as casas ocupadas com um inteiro positivo diferente para cada tipo de peça, sendo o valor atribuído conforme o valor
        da peça (1-Peão, 2-Cavalo, 3-Bispo, 4-Torre, 5-Rainha, 6-Rei)
*/

estado(
        [[0, 0, 3, 0, 2, 0, 0, 0],
        [2, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 5, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 6],
        [0, 0, 2, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 4, 0, 0, 0, 0, 0]]
    ).
    
% calculo_estado(Valor) -> Devolve em Valor o valor utilidade de um dado estado de Xadrez, que resulta do predicado estado(Tabuleiro), penalizando as peças nas margens do tabuleiro
calculo_estado(Valor) :-
    estado(Tabuleiro),
    length(Tabuleiro, Dimensao),
    utilidade(Tabuleiro, Valor, Dimensao, Dimensao).

utilidade([], 0, _, _).
utilidade([Linha|Tabuleiro], Valor, DimensaoDec, Dimensao) :-
    Dimensao1 is DimensaoDec - 1,
    utilidade(Tabuleiro, ValorAnterior, Dimensao1, Dimensao),
    valor_linha(Linha, ValorLinha, DimensaoDec, Dimensao),
    Valor is ValorAnterior + ValorLinha.

valor_linha([], 0, _, _).
valor_linha([Elem|Linha], ValorLinha, Dimensao, Dimensao) :-
    Elem \= 0,
    valor_linha(Linha, ValorLinhaAnterior, Dimensao, Dimensao),
    ValorLinha is ValorLinhaAnterior + Elem - 1, !.    % Penalizar margens - Linha Superior
valor_linha([Elem|Linha], ValorLinha, 1, Dimensao) :-
    Elem \= 0,
    valor_linha(Linha, ValorLinhaAnterior, 1, Dimensao),
    ValorLinha is ValorLinhaAnterior + Elem - 1, !.    % Penalizar margens - Linha Inferior
valor_linha([Elem|Linha], ValorLinha, DimensaoDec, Dimensao) :-
    Elem \= 0,
    Dimensao1 is Dimensao - 1,
    length(Linha, Dimensao1), !,
    valor_linha(Linha, ValorLinhaAnterior, DimensaoDec, Dimensao),
    ValorLinha is ValorLinhaAnterior + Elem - 1.    % Penalizar margens - Primeira Coluna
valor_linha([Elem|Linha], ValorLinha, DimensaoDec, Dimensao) :-
    Elem \= 0,
    length(Linha, 0), !,
    valor_linha(Linha, ValorLinhaAnterior, DimensaoDec, Dimensao),
    ValorLinha is ValorLinhaAnterior + Elem - 1.    % Penalizar margens - Última Coluna
valor_linha([Elem|Linha], ValorLinha, DimensaoDec, Dimensao) :-
    valor_linha(Linha, ValorLinhaAnterior, DimensaoDec, Dimensao),
    ValorLinha is ValorLinhaAnterior + Elem.