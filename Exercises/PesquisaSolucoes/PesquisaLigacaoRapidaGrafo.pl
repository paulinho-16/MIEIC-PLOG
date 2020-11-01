ligado(a,b,1).
ligado(f,i,2).
ligado(a,c,4).
ligado(f,j,3).
ligado(b,d,5).
ligado(f,k,6).
ligado(b,e,3).
ligado(g,l,1).
ligado(b,f,5).
ligado(g,m,2).
ligado(c,g,8).
ligado(k,n,4).
ligado(d,h,1).
ligado(l,o,2).
ligado(d,i,3).
ligado(i,f,7).

% dijkstra(Initial, Final, Solution) -> Finds the path with the minimal cost, from vertex Initial to Final, storing it in Solution
dijkstra(Initial, Final, Solution) :- dijkstra(Initial, Final, [], Solution).
dijkstra(Final, Final, Solution, Solution).
dijkstra(Initial, Final, _, Solution) :-
    setof(Cost-Path, path(Initial, Final, Cost, Path), [_-MinimalPath|_]),
    append(MinimalPath, [Final], CompletePath),
    dijkstra(Final, Final, CompletePath, Solution).

path(X, Y, N, Path) :- path(X, Y, N, [], Path).

path(X, Y, N, Seen, [X]) :-
    \+ memberchk(X, Seen),
    ligado(X, Y, N).
path(X, Z, N, Seen, [X|T]) :-
    \+ memberchk(X, Seen),
    ligado(X, Y, N0),
    path(Y, Z, N1, [X|Seen], T),
    \+ memberchk(X, T),
    N is N0 + N1.