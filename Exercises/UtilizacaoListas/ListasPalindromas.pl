:- include('InversaoListas.pl').

% palindromaInv(Lista) -> determina se a lista Lista é palíndroma (igual lida nos dois sentidos), usando o predicado inverter
palindromaInv(Lista) :- inverter(Lista, Lista).

% palindroma(Lista) -> determina se a lista Lista é palíndroma (igual lida nos dois sentidos), sem usar o predicado inverter
palindroma(Lista) :- palind(Lista, [], Lista).

palind([], L, L).
palind([X|L1], LAcc, L2) :- palind(L1, [X|LAcc], L2).