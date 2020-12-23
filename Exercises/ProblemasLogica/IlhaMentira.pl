:- use_module(library(clpfd)).

% alínea a) - Era realmente segunda-feira, mas ele não é casado
segunda_casado(segunda_feira, Facts) :-
    Facts = [HojeSegunda, _Casado],
    domain(Facts, 0, 1),
    HojeSegunda #= 1,
    member(0, Facts),
    labeling([], Facts).
segunda_casado(outros_dias, Facts) :-
    Facts = [HojeSegunda, _Casado],
    domain(Facts, 0, 1),
    HojeSegunda #= 0,
    \+ member(0, Facts),
    labeling([], Facts).

% alínea b) - Hoje é quinta-feira ou eu sou casado (?)
quinta_feira(segunda_feira, Facts) :-
    Facts = [HojeQuinta, Casado],
    domain(Facts, 0, 1),
    HojeQuinta #= 0,
    Casado #= 0,
    \+ member(1, Facts),
    labeling([], Facts).

quinta_feira(outros_dias, Facts) :-
    Facts = [HojeQuinta, Casado],
    domain(Facts, 0, 1),
    HojeQuinta #= 0,
    Casado #= 0,
    member(1, Facts),
    labeling([], Facts).

quinta_feira(quinta_feira, Facts) :-
    Facts = [HojeQuinta, Casado],
    domain(Facts, 0, 1),
    HojeQuinta #= 1,
    Casado #= 0,
    member(1, Facts),
    labeling([], Facts).

% alínea c) - Numa quinta-feira
jal_amanha(segunda_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 1,
    AmanhaMentirei #= 0,
    \+ member(1, Facts),
    labeling([], Facts).
jal_amanha(outros_dias, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 0,
    \+ member(0, Facts),
    labeling([], Facts).
tak_amanha(quinta_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 0,
    \+ member(1, Facts),
    labeling([], Facts).
tak_amanha(outros_dias, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 0,
    \+ member(0, Facts),
    labeling([], Facts).
tak_amanha(segunda_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 1,
    AmanhaMentirei #= 0,
    \+ member(0, Facts),
    labeling([], Facts).

% alínea d) - Segunda-feira (Tak disse a primeira frase e Jal a segunda)
jal_tak_amanha(segunda_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 1,
    AmanhaMentirei #= 0,
    AmanhaTerca #= 0,
    AmanhaMentirei #= 1,
    labeling([], Facts).
jal_tak_amanha(quinta_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 0,
    AmanhaTerca #= 1,
    AmanhaMentirei #= 0,
    labeling([], Facts).
jal_tak_amanha(quarta_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 1,
    AmanhaTerca #= 1,
    AmanhaMentirei #= 1,
    labeling([], Facts).
jal_tak_amanha(outros_dias, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 0,
    AmanhaTerca #= 1,
    AmanhaMentirei #= 1,
    labeling([], Facts).

tak_jal_amanha(segunda_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 1,
    AmanhaMentirei #= 0,
    AmanhaTerca #= 1,
    AmanhaMentirei #= 0,
    labeling([], Facts).
tak_jal_amanha(quinta_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 0,
    AmanhaTerca #= 1,
    AmanhaMentirei #= 0,
    labeling([], Facts).
tak_jal_amanha(quarta_feira, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 0,
    AmanhaTerca #= 1,
    AmanhaMentirei #= 1,
    labeling([], Facts).
tak_jal_amanha(outros_dias, Facts) :-
    Facts = [AmanhaTerca, AmanhaMentirei],
    domain(Facts, 0, 1),
    AmanhaTerca #= 0,
    AmanhaMentirei #= 0,
    AmanhaTerca #= 1,
    AmanhaMentirei #= 1,
    labeling([], Facts).

/*
    alínea e):
        - Essa acusação é falsa. Se há uma pessoa A que mente num dado dia da semana, então deve existir uma pessoa A' que mente em todos os dias em que A fala a verdade e fala a verdade no dia que A mente.
        Para os dois juntos, não haverá um único dia em que ambos falarão a verdade e, portanto, deve existir um habitante C que mentirá todos os dias e, portanto, um habitante C' que fala a verdade todos os dias, contrariando assim as más línguas
*/

mas_linguas(D) :-
    A = [0, 1, 1, 1, 1],
    inverso(A, B),
    ambos_verdade(A, B, C),
    inverso(C, D).

troca(0, 1).
troca(1, 0).

ambos(1, 1, 1).
ambos(_, _, 0).

inverso([], []).
inverso([A|As], [B|Bs]) :-
    troca(A, B),
    inverso(As, Bs).

ambos_verdade([], [], []).
ambos_verdade([A|As], [B|Bs], [C|Cs]) :-
    ambos(A, B, C),
    ambos_verdade(As, Bs, Cs).