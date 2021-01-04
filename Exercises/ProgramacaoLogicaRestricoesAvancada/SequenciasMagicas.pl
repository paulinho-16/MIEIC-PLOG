:- use_module(library(clpfd)).

% sequencias_magicas(Seq, N) -> calcula sequências mágicas de comprimento N, armazenando o resultado em Seq
%                               Uma sequência mágica de comprimento N é uma sequência de inteiros X0, X1, ..., Xn-1 tal que para todo o i = 0,1,...,n-1,
%                               Xi é um inteiro entre 0 e n-1, e o número i ocorre exatamente Xi vezes na sequência
sequencias_magicas(Seq, N) :-
    length(Seq, N),
    domain(Seq, 0, N),
    verify_magic(Seq),
    labeling([], Seq).

verify_magic(Seq) :-
    build_cardinality(Seq, 0, Cardinality),
    global_cardinality(Seq, Cardinality).
       
build_cardinality([], _, []).
build_cardinality([Elem|Seq], Ind, [Ind-Elem|Cardinality]) :-
    NewInd is Ind + 1,
    build_cardinality(Seq, NewInd, Cardinality).