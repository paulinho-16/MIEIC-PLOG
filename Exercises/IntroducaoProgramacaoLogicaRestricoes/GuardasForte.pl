:- use_module(library(clpfd)).

% guardas(Vars) -> devolve em Vars o resultado das posições dos guardas no forte desenhado em baixo, no formato [LadoEsquerdo, LadoDireito, Frente, Trás],
%                  sabendo que são 12 guardas e que cada lado tem que estar guardado por 5.
guardas(Vars) :-
    formar_forte(Vars),
    flatten(Vars, Flat),
    domain(Flat, 0, 1),
    labeling([], Flat),
    global_cardinality(Flat, [1-12, 0-6]).

flatten([], []).
flatten([H | T], FlatBoard):-
    flatten(T, NewFlat),
    append(H, NewFlat, FlatBoard).

formar_forte([Left|Vars]) :-
    length(Left, 6),
    sum(Left, #=, 5),
    Vars = [Right|Rest],
    length(Right, 6),
    sum(Right, #=, 5),
    Rest = [Top|OtherRest],
    length(Top, 3),
    sum(Top, #>=, 1),
    OtherRest = [Bottom|[]],
    length(Bottom, 3),
    sum(Bottom, #>=, 1).

/* 
    Forte: (enunciado mal explicado... imagine-se assim)

    1 13 14 15 7 
     _ _ _ _ _
  1 |         | 7
  2 |         | 8
  3 |         | 9
  4 |         | 10
  5 |         | 11
  6 |         | 12
     _ _ _ _ _
    6 13 14 15 12
*/