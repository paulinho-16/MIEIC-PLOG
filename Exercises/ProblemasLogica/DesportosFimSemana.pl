:- use_module(library(clpfd)).

nome(1, 'Claudio').
nome(2, 'David').
nome(3, 'Domingos').
nome(4, 'Francisco').
nome(5, 'Marcelo').
nome(6, 'Paulo').

desporto(1, 'Ping-Pong').
desporto(2, 'Futebol').
desporto(3, 'Andebol').
desporto(4, 'Rugby').
desporto(5, 'Tenis').
desporto(6, 'Voleibol').

% desportos -> resolve o problema dos desportos ao fim-de-semana, com base na informação dada
desportos :-
    Desportos = [_PingPong, Futebol, Andebol, Rugby, Tenis, Voleibol],
    domain(Desportos, 1, 6),
    all_distinct(Desportos),
    Tenis #\= 5,
    Voleibol #\= 4, Voleibol #\= 6,
    Rugby #\= 3,
    Andebol #\= 1, Andebol #\= 4, Rugby #\= 1, Rugby #\= 4,
    Tenis #= 2, Futebol #= 5,
    labeling([], Desportos),
    escrever(Desportos, 1).

escrever([], _).
escrever([Desporto|Desportos], N) :-
    nome(Desporto, Nome),
    desporto(N, NomeDesporto),
    write(Nome), write(' pratica '), write(NomeDesporto), nl,
    N1 is N + 1,
    escrever(Desportos, N1).