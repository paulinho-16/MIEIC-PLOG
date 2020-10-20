% slice(Lista, Ind1, Ind2, Result) -> extrai uma fatia da lista Lista, desde o índice Ind1 até ao índice Ind2 (ambos os extremos incluídos), armazenando o resultado em Result
slice(Lista, Ind1, Ind2, Result) :- fatia(Lista, Ind1, Ind2, 1, Result).

fatia([], _, _, _, []).
fatia([X|Lista], Ind1, Ind2, N, [X|Result]) :-
    N >= Ind1,
    N =< Ind2,
    N1 is N + 1,
    fatia(Lista, Ind1, Ind2, N1, Result).

fatia([_|Lista], Ind1, Ind2, N, Result) :- 
    (N < Ind1 ; N > Ind2),
    N1 is N + 1,
    fatia(Lista, Ind1, Ind2, N1, Result).