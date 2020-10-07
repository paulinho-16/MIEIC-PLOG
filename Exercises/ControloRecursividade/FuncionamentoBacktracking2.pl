a(a1,1).
a(A,2).
a(a3,N).

b(1,b1).
b(2,B).
b(N,b3).

c(X,Y) :- a(X,N), b(N,Y).

d(X,Y) :- a(X,N), b(Y,N).
d(X,Y) :- a(N,X), b(N,Y).

/*
    alínea a):
        - yes
    alínea b):
        - X = 2
    alínea c):
        - X = a1
        - X pode tomar qualquer outro valor
    alínea d):
        - X = a1, Y = b1
        - X = a1, Y = b3
        - X pode tomar qualquer outro valor, assim como Y
    alínea e):
        - X = a1, Y = 2
        - X pode tomar qualquer outro valor e Y = 2
        - X = a3, Y = 1
        - X = a3, Y = 2
        - X = a3, e Y pode tomar qualquer outro valor
        - X = 1, Y = b3
        - X = 2, Y = b1
        - X = 2, e Y pode tomar qualquer outro valor
        - X = 2, Y = b3
        - X pode tomar qualquer outro valor e Y = b3
*/