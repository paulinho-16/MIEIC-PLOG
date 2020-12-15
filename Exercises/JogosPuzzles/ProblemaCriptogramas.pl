puzzle(1,[D,O,_N,A,L,D],[_G,E,R,A,L,D],[R,O,_B,E,R,_T]).
puzzle(2,[0,_C,R,O,S,S],[0,R,O,A,D,S],[D,A,_N,_G,_E,R]).
puzzle(3,[0,_S,E,N,_D],[0,M,O,_R,E],[M,O,N,E,_Y]).

% criptograma(X) -> Resolve o criptograma X, vindo do predicado puzzle(), que consiste em atribuir dígitos decimais às letras, de modo a que a respetiva soma seja válida
criptograma(X) :-
    puzzle(X, P1, P2, Result),
    soma(P1, P2, Result, 0, 0, [0,1,2,3,4,5,6,7,8,9], _),
    write(P1), write(' + '), write(P2), write(' = '), write(Result).

soma([], [], _, 0, 0, Digts, Digts).
soma([D1|R1], [D2|R2], [D|R], Cant, Cap, Digts, Ddisp) :-
    soma(R1, R2, R, Cant, Cap1, Digts, Ddisp1),
    soma_dig(D1, D2, D, Cap1, Cap, Ddisp1, Ddisp).

soma_dig(D1, D2, D, Cant, Cap, Ddant, Ddap) :-
    del(D1, Ddant, Ddaux1),
    del(D2, Ddaux1, Ddaux2),
    del(D, Ddaux2, Ddap),
    S is D1 + D2 + Cant,
    D is S mod 10,
    Cap is S // 10.

del(A, L, L) :- nonvar(A), !.
del(A, [A|L], L).
del(A, [H|T], [H|T1]) :- del(A, T, T1).