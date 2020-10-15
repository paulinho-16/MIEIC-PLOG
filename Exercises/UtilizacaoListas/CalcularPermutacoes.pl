:- include('OrdenacaoListas.pl').

% permutacao(L1, L2) -> sucesso se a lista L2 for uma permutação da lista L1
permutacao(L1, L2) :- ordena(L1, NL1), ordena(L2, NL2), NL1 == NL2.

% permutacao2(L1, L2) -> sucesso se a lista L2 for uma permutação da lista L1 (outra forma)
% (não considera elementos repetidos)
permutacao2([], _).
permutacao2([H|L1], L2) :-
    [H|L1] \= L2,
    member(H, L2),
    permutacao2(L1, L2).