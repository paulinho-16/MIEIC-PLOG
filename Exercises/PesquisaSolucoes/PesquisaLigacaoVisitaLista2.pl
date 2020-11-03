ligacao(1, 2).
ligacao(1, 3).
ligacao(2, 4).
ligacao(3, 4).
ligacao(3, 6).
ligacao(4, 6).
ligacao(5, 6).

% ligacao2(X, Y) :- permite a bidirecionalidade das ligações (grafo não dirigido)
ligacao2(X, Y) :- ligacao(X, Y).
ligacao2(X, Y) :- ligacao(Y, X).

% caminho(NoInicio, NoFim, Lista) -> encontra um possível caminho entre o nó NoInicio e o nó NoFim de um grafo não dirigido, armazenando-o em Lista
caminho(NoInicio, NoFim, Lista) :-
    encontra_caminho(NoInicio, NoFim, [NoInicio], Lista, 5).

encontra_caminho(NoInicio, NoFim, LAcc, Lista, _) :-
    ligacao2(NoInicio, NoFim),
    append(LAcc, [NoFim], Lista).

encontra_caminho(NoInicio, NoFim, LAcc, Lista, N) :-
    N > 0,
    ligacao2(NoInicio, NoInterm),
    NoInterm \= NoFim,
    \+ (member(NoInterm, LAcc)),
    append(LAcc, [NoInterm], NewLAcc),
    N2 is N - 1,
    encontra_caminho(NoInterm, NoFim, NewLAcc, Lista, N2).

% ciclos(No, Comp, Lista) -> calcula todos os ciclos possíveis do nó No, com comprimento inferior a Comp, armazenando-os em Lista
encontra_caminho2(NoInicio, NoFim, Lista, Lista, _) :-
    ligacao2(NoInicio, NoFim),
    length(Lista, Length),
    Length > 2.

encontra_caminho2(NoInicio, NoFim, LAcc, Lista, N) :-
    N > 0,
    ligacao2(NoInicio, NoInterm),
    NoInterm \= NoFim,
    \+ (member(NoInterm, LAcc)),
    append(LAcc, [NoInterm], NewLAcc),
    N2 is N - 1,
    encontra_caminho2(NoInterm, NoFim, NewLAcc, Lista, N2).

ciclos(No, Comp, Lista):-
    Comp1 is Comp - 1,
    findall(Ciclo, encontra_caminho2(No, No, [No], Ciclo, Comp1), Lista).