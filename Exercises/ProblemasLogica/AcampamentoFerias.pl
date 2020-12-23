:- use_module(library(clpfd)).

nome(1, 'Joao').
nome(2, 'Miguel').
nome(3, 'Nadia').
nome(4, 'Silvia').
nome(5, 'Afonso').
nome(6, 'Cristina').
nome(7, 'Geraldo').
nome(8, 'Julio').
nome(9, 'Maria').
nome(10, 'Maximo').
nome(11, 'Manuel').
nome(12, 'Ivone').

bebida(1, 'Limonada').
bebida(2, 'Guarana').
bebida(3, 'Whisky').
bebida(4, 'Vinho').
bebida(5, 'Champanhe').
bebida(6, 'Agua').
bebida(7, 'Laranjada').
bebida(8, 'Cafe').
bebida(9, 'Cha').
bebida(10, 'Vermouth').
bebida(11, 'Cerveja').
bebida(12, 'Vodka').

% ferias -> resolve o problema do acampamento de férias, com base na informação dada
ferias :-
    Bebidas = [Limonada, Guarana, Whisky, _Vinho, Champanhe, Agua, Laranjada, Cafe, Cha, Vermouth, Cerveja, Vodka],
    
    domain(Bebidas, 1, 12),
    all_distinct(Bebidas),

    Vodka #\= 7, Vodka #\= 8, Cerveja #\= 7, Cerveja #\= 8,
    Vermouth #\= 7, Vermouth #\= 8, Cha #\= 7, Cha #\= 8,
    Cafe #\= 7, Cafe #\= 8, Laranjada #\= 7, Laranjada #\= 8,

    Vodka #\= 9, Vodka #\= 10, Cerveja #\= 9, Cerveja #\= 10,
    Vermouth #\= 9, Vermouth #\= 10, Cha #\= 9, Cha #\= 10,
    Cafe #\= 9, Cafe #\= 10, Laranjada #\= 9, Laranjada #\= 10,

    Vodka #\= 11, Vodka #\= 12, Cerveja #\= 11, Cerveja #\= 12,
    Vermouth #\= 11, Vermouth #\= 12, Cha #\= 11, Cha #\= 12,
    Cafe #\= 11, Cafe #\= 12, Laranjada #\= 11, Laranjada #\= 12,

    Cha #\= 1, Cha #\= 2, Cafe #\= 1, Cafe #\= 2,
    Cha #\= 7, Cha #\= 8, Cafe #\= 7, Cafe #\= 8,
    Cha #\= 3, Cha #\= 9, Cafe #\= 3, Cafe #\= 9,

    Guarana #\= 7, Guarana #\= 8, Whisky #\= 7, Whisky #\= 8,
    Guarana #\= 1, Guarana #\= 2, Whisky #\= 1, Whisky #\= 2,
    Guarana #\= 3, Guarana #\= 9, Whisky #\= 3, Whisky #\= 9,

    Laranjada #\= 3, Laranjada #\= 9, Limonada #\= 3, Limonada #\= 9,
    Laranjada #\= 1, Laranjada #\= 2, Limonada #\= 1, Limonada #\= 2,
    Laranjada #\= 7, Laranjada #\= 8, Limonada #\= 7, Limonada #\= 8,

    Agua #\= 7, Agua #\= 10, Whisky #\= 7, Whisky #\= 10,
    Cha #\= 1, Cha #\= 4, Vodka #\= 1, Vodka #\= 4,
    Cha #\= 7, Cha #\= 10, Vodka #\= 7, Vodka #\= 10,
    Agua #\= 1, Agua #\= 4, Whisky #\= 1, Whisky #\= 4,

    Champanhe #\= 8, Agua #\= 8,
    Guarana #\= 2, Vodka #\= 2,
    Guarana #\= 10, Guarana #\= 11,
    Cafe #\= 4, Cafe #\= 5,

    labeling([], Bebidas),
    escrever(Bebidas, 1).

escrever([], _).
escrever([Bebida|Bebidas], N) :-
    N1 is N + 1,
    nome(Bebida, Nome), bebida(N, NomeBebida),
    write(Nome), write(' bebe '), write(NomeBebida), nl,
    escrever(Bebidas, N1).