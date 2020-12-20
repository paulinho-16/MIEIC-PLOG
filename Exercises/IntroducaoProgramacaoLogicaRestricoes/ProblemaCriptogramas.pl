:- use_module(library(clpfd)).

puzzle(1,[0,_S,E,N,_D],[0,M,O,_R,E],[M,O,N,E,_Y]).
puzzle(2,[D,O,_N,A,L,D],[_G,E,R,A,L,D],[R,O,_B,E,R,_T]).
puzzle(3,[0,_C,R,O,S,S],[0,R,O,A,D,S],[D,A,_N,_G,_E,R]).

% Resolve o criptograma número 1, de forma simples
send_simple(Vars) :-
    Vars = [S, E, N, D, M, O, R, Y],
    domain(Vars, 0, 9),
    all_different(Vars),
    S #\= 0, M #\= 0,
    S * 1000 + E * 100 + N * 10 + D + M * 1000 + O * 100 + R * 10 + E #= M * 10000 + O * 1000 + N * 100 + E * 10 + Y,
    labeling([], Vars).

% Resolve o criptograma número 1, de forma eficiente
send_efficient(Vars) :-
    Vars = [S, E, N, D, M, O, R, Y],
    domain(Vars, 0, 9),
    domain([C1, C2, C3, C4], 0, 1),
    all_distinct(Vars),
    S #\= 0, M #\= 0,
    D + E #= Y + C1 * 10,
    N + R + C1 #= E + C2 * 10,
    E + O + C2 #= N + C3 * 10,
    S + M + C3 #= O + C4 * 10,
    C4 #= M,
    labeling([ff], Vars).

% solve_cryptogram(N, Vars) -> resolve o criptograma número N, armazenando o resultado em Vars
%                              O problema consiste em atribuir dígitos decimais às letras, de modo a que a respetiva soma seja válida

% Resolve o criptograma número 1
solve_cryptogram(1, Vars) :-
    send_efficient(Vars).

% Resolve o criptograma número 2
solve_cryptogram(2, Vars) :-
    Vars = [D, O, N, A, L, G, E, R, B, T],
    domain(Vars, 0, 9),
    domain([C1, C2, C3, C4, C5], 0, 1),
    all_distinct(Vars),
    D #\= 0, G #\= 0,
    D + D #= T + C1 * 10,
    L + L + C1 #= R + C2 * 10,
    A + A + C2 #= E + C3 * 10,
    N + R + C3 #= B + C4 * 10,
    O + E + C4 #= O + C5 * 10,
    D + G + C5 #= R,
    labeling([ff], Vars).

% Resolve o criptograma número 3
solve_cryptogram(3, Vars) :-
    Vars = [C, R, O, S, A, D, N, G, E],
    domain(Vars, 0, 9),
    domain([C1, C2, C3, C4, C5], 0, 1),
    all_distinct(Vars),
    C #\= 0, R #\= 0,
    S + S #= R + C1 * 10,
    S + D + C1 #= E + C2 * 10,
    O + A + C2 #= G + C3 * 10,
    R + O + C3 #= N + C4 * 10,
    C + R + C4 #= A + C5 * 10,
    C5 #= D,
    labeling([ff], Vars).