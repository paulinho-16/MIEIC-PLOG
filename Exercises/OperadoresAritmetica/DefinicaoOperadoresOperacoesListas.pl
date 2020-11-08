% Operador existe_em: X existe_em Lista -> verdadeiro se a lista Lista contiver o elemento X
:- op(200, xfx, existe_em).

X existe_em [X|_].
X existe_em [_|L] :- X existe_em L.

% Operador concatena: concatena Lista1 e Lista2 da Lista -> concatena as listas Lista1 e Lista2, armazenando o resultado em Lista
:- op(200, fx, concatena).
:- op(150, xfx, da).
:- op(100, xfx, e).

concatena [] e L da L.
concatena [X|L1] e L2 da [X|L3] :- concatena L1 e L2 da L3.

% Operador apaga: apaga Elemento a Lista da NovaLista -> apaga o elemento Elemento da lista Lista, armazenando o resultado em NovaLista
:- op(200, fx, apaga).
:- op(150, xfx, da).
:- op(100, xfx, a).

apaga _ a [] da [].
apaga X a [X|L] da L1 :- apaga X a L da L1.
apaga X a [Y|L] da [Y|L1] :- apaga X a L da L1.