% tem_fator(N, F) -> determina se um dado número N é divisível por F
tem_fator(N, F) :- N mod F =:= 0.
tem_fator(N, F) :-
    F * F < N,
    F2 is F + 2,
    tem_fator(N, F2).

% e_primo(N) -> determina se um dado número N é primo
e_primo(2).
e_primo(3).     % <-- Casos Base
e_primo(N) :-
    integer(N),
    N > 3,
    N mod 2 =\= 0,
    \+ tem_fator(N, 3).
