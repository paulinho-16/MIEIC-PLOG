% Calculates the factorial of a number N, stored in Valor - Recursive way
factorialR(0, 1). % <-- Base Case
factorialR(N, Valor) :-
    N > 0,
    N1 is N - 1,
    factorialR(N1, V1),
    Valor is N * V1.

% Calculates the factorial of a number N using increment Acc, stored in Valor - Iterative way
factorialI(0, Valor, Valor). % <-- Base Case
factorialI(N, Valor) :- factorialI(N, 1, Valor).
factorialI(N, Acc, Valor) :-
    N > 0,
    N1 is N - 1,
    Acc1 is Acc * N,
    factorialI(N1, Acc1, Valor).

% Calculates the fibonacci of a number N
fibonacci(0, 1).
fibonacci(1, 1).    % <-- Base Cases
fibonacci(N, Fib) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, Fib1),
    fibonacci(N2, Fib2),
    Fib is Fib1 + Fib2.
