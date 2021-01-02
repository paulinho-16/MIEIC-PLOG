:- use_module(library(clpfd)).

cor(1, 'amarelo').
cor(2, 'verde').
cor(3, 'vermelho').
cor(4, 'azul').

% outra_fila_carros -> resolve o problema da outra fila de carros, com base nas informações dadas
outra_fila_carros :-
    Carros = [C1, C2, _C3, _C4, 4, _C6, _C7, _C8, _C9, _C10, C11, C12],
    global_cardinality(Carros, [1-4, 2-2, 3-3, 4-3]),
    C1 #= C12,
    C2 #= C11,
    sub_sequencias(Carros),
    sequencia_unica(Carros, 0),
    labeling([], Carros),
    get_cores(Carros, Cores),
    write(Cores).

sub_sequencias(Carros) :-
    length(Carros, Length),
    Length #< 3.
sub_sequencias([X, Y, Z|Carros]) :-
    all_distinct([X, Y, Z]),
    sub_sequencias([Y, Z|Carros]).

sequencia_unica(Carros, 1) :-
    length(Carros, Length),
    Length #< 4.
sequencia_unica([X, Y, Z, W|Carros], Seq) :-
    (X #= 1 #/\ Y #= 2 #/\ Z #= 3 #/\ W #= 4) #<=> Bool,
    NewSeq #= Seq + Bool,
    sequencia_unica([Y, Z, W|Carros], NewSeq).

get_cores([], []).
get_cores([C|Carros], [Cor|Cores]) :-
    cor(C, Cor),
    get_cores(Carros, Cores).