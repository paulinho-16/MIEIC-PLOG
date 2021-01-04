:- use_module(library(clpfd)).
:- use_module(library(lists)).

% hexagono_magico(Hexagono) -> resolve o hexágono mágico de ordem 3, armazenando o resultado em Hexagono
%                              Um hexágono mágico tem a soma de todas as diagonais e das linhas igual a um dado valor
hexagono_magico(Hexagono) :-
    Hexagono = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S],
    domain(Hexagono, 1, 19),
    all_distinct(Hexagono),
    maplist(sum_38, [[A, B, C], [D, E, F, G], [H, I, J, K, L], [M, N, O, P], [Q, R, S],
                     [A, D, H], [B, E, I, M], [C, F, J, N, Q], [G, K, O, R], [L, P, S],
                     [C, G, L], [B, F, K, P], [A, E, J, O, S], [D, I, N, R], [H, M, Q]]),
    labeling([], Hexagono).

sum_38(List) :- sum(List, #=, 38).