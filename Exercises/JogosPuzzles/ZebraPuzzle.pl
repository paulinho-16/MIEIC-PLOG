casas(Casas) :-
    length(Casas, 5),
    member(h(ingles, _, _, _, vermelho), Casas),
    member(h(espanhol, _, _, cao, _), Casas),
    Casas = [h(noruegues, _, _, _, _)|_],
    member(h(_, _, marlboro, _, amarelo), Casas),
    adjacent(h(_, _,chesterfields, _, _), h(_, _, _, raposa, _), Casas),
    adjacent(h(noruegues, _, _, _, _), h(_, _, _, _, azul), Casas),
    member(h(_, _, winston, iguana, _), Casas),
    member(h(_, sumo_laranja, luky_strike, _, _), Casas),
    member(h(ucraniano, cha, _, _, _), Casas),
    member(h(portugues, _, sg_lights, _, _), Casas),
    adjacent(h(_, _, marlboro, _, _), h(_, _, _, cavalo, _), Casas),
    member(h(_, cafe, _, _, verde), Casas),
    right(h(_, _, _, _, verde), h(_, _, _, _, branco), Casas),
    Casas = [_, _,h(_, leite, _, _, _), _, _],
    member(h(_, _, _, zebra, _), Casas),
    member(h(_, agua, _, _, _), Casas).

adjacent(Casa1, Casa2, Casas) :- append(_, [Casa1, Casa2|_], Casas).
adjacent(Casa1, Casa2, Casas) :- append(_, [Casa2, Casa1|_], Casas).

right(Casa1, Casa2, Casas) :- append(_, [Casa2, Casa1|_], Casas).

% casa_zebra(Casa) -> devolve a casa onde vive a zebra, resolvendo o problema "Zebra Puzzle", no formato h(Nacionalidade, Bebida, MarcaCigarros, Animal, Cor)
casa_zebra(Casa) :-
    casas(Casas),
    Casa = h(_, _, _, zebra, _),
    member(Casa, Casas).

% casa_agua(Casa) -> devolve a casa onde se bebe água, resolvendo o problema "Zebra Puzzle", no formato h(Nacionalidade, Bebida, MarcaCigarros, Animal, Cor)
casa_agua(Casa) :-
    casas(Casas),
    Casa = h(_, agua, _, _, _),
    member(Casa, Casas).