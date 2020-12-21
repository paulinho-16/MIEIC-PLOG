:- use_module(library(clpfd)).

% sol(A, B, C) -> devolve em A, B e C três números que têm a sua soma igual ao seu produto
sol(A, B, C) :-
   domain([A, B, C], 1, 1000),
    A * B * C #= A + B + C,
    C #>= B, B #>= A,   % Eliminar simetrias
    labeling([], [A, B, C]).