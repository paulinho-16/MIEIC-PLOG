:- use_module(library(lists)).
:- use_module(library(between)).

% vence(Pilhas, Fosforos, NovasPilhas) -> indica se existe uma jogada para a qual um dos jogadores pode sempre vencer o jogo (quaisquer que sejam a partir dessa jogada os lances do opositor), retirando Fosforos fósforos de uma das Pilhas, resultando em NovasPilhas
vence([X], X, []).  % para ganhar apanha todos os fósforos

vence(L, X, L1) :-  % vence se faz uma jogada a partir da qual o adversário não vence
    joga(L, X, L1),
    \+ vence(L1, _, _).

joga(S, X, S1) :-   % apanha todos os fósforos de uma pilha
    select(X, S, S1).
joga(S, X, [Y1|S1]) :-   % apanha alguns fósforos
    select(Y, S, S1),
    numlist(1, Y, List),
    member(X, List),
    Y1 is Y - X,
    Y1 > 0.