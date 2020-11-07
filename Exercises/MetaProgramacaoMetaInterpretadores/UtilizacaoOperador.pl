f(X, Y) :- Y is X*X.

duplica(X, Y) :- Y is 2*X.

% map(Lista, Funcao, NovaLista) -> efetua o mapeamento de uma lista, usando o predicado Funcao, armazenando o resultado em NovaLista
map([], _, []).
map([C|Lista], Funcao, [TC|NovaLista]) :-
    aplica(Funcao, [C, TC]),
    map(Lista, Funcao, NovaLista).

aplica(Funcao, LArgs) :- G =.. [Funcao|LArgs], G.