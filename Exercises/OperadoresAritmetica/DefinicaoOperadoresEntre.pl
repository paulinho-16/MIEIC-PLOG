% entre(N1, N2, X) -> produz através de backtracking todos os inteiros X que satisfazem a restrição N1 >= X >= N2
entre(N1, N2, X) :- N1 >= N2, X = N1.
entre(N1, N2, X) :-
    N1 > N2,
    N3 is N1 - 1,
    entre(N3, N2, X).