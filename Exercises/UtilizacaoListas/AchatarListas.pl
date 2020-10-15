% achata_lista(Lista, ElemsLista) -> Lista é uma lista eventualmente de listas e ElemsLista é uma lista com todos os elementos de Lista ao mesmo nível
achata_lista([], []).
achata_lista(X, [X]) :- atomic(X).
achata_lista([H|Lista], ElemsLista) :-
    achata_lista(H, L1),
    achata_lista(Lista, L2),
    append(L1, L2, ElemsLista).