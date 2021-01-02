:- use_module(library(clpfd)).

% liquido_po -> resolve o problema do líquido ou pó, com base nas informações dadas
liquido_po :-
    Vars = [Nenhum, SoLiquido, SoPo, LiquidoPo],
    domain(Vars, 0, 10000),
    PessoasInterrogadas #= Nenhum + SoLiquido + SoPo + LiquidoPo,
    (Nenhum + SoLiquido) * 3 #= PessoasInterrogadas,
    (Nenhum + SoPo) * 7 #= 2 * PessoasInterrogadas,
    LiquidoPo #= 427,
    5 * Nenhum #= PessoasInterrogadas,
    labeling([], Vars),
    write(Nenhum), write(' pessoas nao utilizam o produto'), nl,
    write(SoLiquido), write(' pessoas utilizam apenas o liquido'), nl,
    write(SoPo), write(' pessoas utilizam apenas o po'), nl,
    write(LiquidoPo), write(' pessoas utilizam o liquido e o po'), nl, nl,
    write('Ao todo, foram interrogadas '), write(PessoasInterrogadas), write(' pessoas'), nl.