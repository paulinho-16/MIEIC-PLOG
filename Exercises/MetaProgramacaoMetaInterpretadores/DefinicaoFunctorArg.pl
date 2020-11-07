% functor2(Term, F, Arity) -> verdadeiro se Term é um termo cujo functor principal tem o nome F e a aridade Arity
functor2(Term, F, Arity) :- Term =.. [F|Args], length(Args, Arity).

% arg_(N, Term, Arg) -> verdadeiro se Arg é o N-ésimo argumento do termo Term
arg_(N, Term, Arg) :- Term =.. [_|Args], position(N, Args, Arg).

position(1, [Arg|_], Arg).
position(N, [_|Args], Arg) :-
    N > 1,
    N1 is N - 1,
    position(N1, Args, Arg).