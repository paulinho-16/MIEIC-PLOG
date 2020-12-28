:- use_module(library(clpfd)).

nome(1, 'Hortensia').
nome(2, 'Eugenia').
nome(3, 'Honoria').
nome(4, 'Leticia').
nome(5, 'Outra').

hobby(1, ' coleciona cerveja.').
hobby(2, ' treina para a Maratona.').
hobby(3, ' cria piranhas.').
hobby(4, ' levanta pesos.').
hobby(5, ' pesca salmao.').

habito(1, ' bebe tequila.').
habito(2, ' fuma cachimbo.').
habito(3, ' come dois ovos crus por dia.').
habito(4, ' bebe vodka.').
habito(5, ' resolve problemas de logica').

flatten([], []).
flatten([H | T], FlatBoard):-
    flatten(T, NewFlat),
    append(H, NewFlat, FlatBoard).

% tias -> resolve o problema das tias excêntricas, com base nas informações dadas
% O erro do exercício é a falta de informação, tendo em conta que nem o nome da quinta tia fornecem .-.
% Daí existirem várias possibilidades que cumprem os requisitos do enunciado
tias :-
    Total = [Hobbies, Habitos, Idades],
    Hobbies = [ColecionaCerveja, TreinaMaratona, CriaPiranhas, LevantaPesos, PescaSalmao],
    Habitos = [BebeTequila, FumaCachimbo, DoisOvosDia, BebeVodka, ResolveLogica],
    Idades = [IdadeHortensia, _IdadeEugenia, IdadeHonoria, _IdadeLeticia, _IdadeOutra],
    domain(Hobbies, 1, 5), domain(Habitos, 1, 5), domain(Idades, 70, 79),
    all_distinct(Hobbies), all_distinct(Habitos),
    BebeTequila #= 1, ColecionaCerveja #\= 1,
    element(ColecionaCerveja, Idades, IdadeColecionadora), IdadeHortensia #= IdadeColecionadora + 2,
    ResolveLogica #= TreinaMaratona, ResolveLogica #\= 2,
    IdadeHonoria #= 74, FumaCachimbo #\= 3,
    CriaPiranhas #= 4, maximum_arg(Idades, IndMax), IndMax #\= 4,
    element(DoisOvosDia, Idades, IdadeOvos), element(LevantaPesos, Idades, IdadePesos), IdadeOvos #= IdadePesos - 2,
    BebeVodka #\= 3,
    element(PescaSalmao, Idades, IdadeSalmao), IdadeSalmao #= 77,
    flatten(Total, FlatTotal),
    labeling([], FlatTotal),
    escrever_hobbies(Hobbies, 1), nl,
    escrever_habitos(Habitos, 1), nl,
    escrever_idades(Idades, 1).

escrever_hobbies([], _).
escrever_hobbies([Hobby|Hobbies], N) :-
    nome(Hobby, Nome),
    hobby(N, NomeHobby),
    write(Nome), write(NomeHobby), nl,
    N1 is N + 1,
    escrever_hobbies(Hobbies, N1).

escrever_habitos([], _).
escrever_habitos([Habito|Habitos], N) :-
    nome(Habito, Nome),
    habito(N, NomeHabito),
    write(Nome), write(NomeHabito), nl,
    N1 is N + 1,
    escrever_habitos(Habitos, N1).

escrever_idades([], _).
escrever_idades([Idade|Idades], N) :-
    nome(N, Nome),
    write(Nome), write(' tem '), write(Idade), write(' anos.'), nl,
    N1 is N + 1,
    escrever_idades(Idades, N1).