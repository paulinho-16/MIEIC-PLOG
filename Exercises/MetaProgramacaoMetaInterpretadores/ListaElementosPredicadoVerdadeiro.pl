par(X) :- X mod 2 =:= 0.

aplica(Funcao, LArgs) :- G =.. [Funcao|LArgs], G.

% separa(L, Pred, Lista) -> armazena em Lista os mesmos elementos de L, mas em que primeiro aparecem todos aqueles que tornam verdadeiro o predicado Pred
separa(L, Pred, Lista) :- sepDL(L, Pred, Lista-Nots, Nots-[]).

sepDL([], _, Lista-Lista, Nots-Nots).
sepDL([Elem|L], Pred, [Elem|Lista]-DY, N) :- aplica(Pred, [Elem]), !, sepDL(L, Pred, Lista-DY, N).
sepDL([Elem|L], Pred, Lista, [Elem|Nots]-DN) :- sepDL(L, Pred, Lista, Nots-DN).