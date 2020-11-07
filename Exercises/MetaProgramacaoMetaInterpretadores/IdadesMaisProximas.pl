idade(maria,30).
idade(pedro,25).
idade(jose,25).
idade(rita,18).

% mais_proximos(Idade, ListaProximos) -> devolve em ListaProximos o nome dos indivíduos cuja idade é mais próxima de Idade
mais_proximos(Idade, [N1|ListaProximos]) :-
    setof(Dif-Nome, prox(Idade, Dif, Nome), [D1-N1|L]),
    primeiros(D1, L, ListaProximos).

prox(Idade, Dif, Nome) :- idade(Nome, I), dif(Idade, I, Dif).

dif(Idade, I, Dif) :- Idade > I, !, Dif is Idade - I.
dif(Idade, I, Dif) :- Dif is I - Idade.

primeiros(_, [], []).
primeiros(D1, [D-_|_], []) :- D > D1, !.
primeiros(D1, [_-Nome|L], [Nome|ListaProximos]) :- primeiros(D1, L, ListaProximos).