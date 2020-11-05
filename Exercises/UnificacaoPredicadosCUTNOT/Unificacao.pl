% unificavel(L1, Termo, L2) -> retorna uma lista com todos os elementos de L1 que são unificáveis com Termo, armazenando-a em L2. Os elementos de L2 não são no entanto unificados com Termo
unificavel([], _, []).
unificavel([T|Resto], T1, Resto1) :-
    \+ T=T1, !,
    unificavel(Resto, T1, Resto1).
unificavel([T|Resto], T1, [T|Resto1]) :- unificavel(Resto, T1, Resto1).