t(0+1, 1+0).
t(X+0+1, X+1+0).
t(X+1+1, Z) :-
    t(X+1, X1),
    t(X1+1, Z).

/*
    alínea a):
        A = 1+0
    alínea b):
        B = 1+1+0
    alínea c):
        C = 1+1+1+1+0
    alínea d):
        D = 1+1+0+1
        D = 1+0+1+1
        D = 0+1+1+1
*/