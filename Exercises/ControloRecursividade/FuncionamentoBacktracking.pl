% question(X, Y, Z) -> the question in the statement
question(X, Y, Z) :- r(X, Y), s(Y, Z), \+(r(Y, X)), \+(s(Y, Y)).

r(a, b).
r(a, c).
r(b, a).
r(a, d).
s(b, c).
s(b, d).
s(c, c).
s(d, e).

/*
    alínea a):
        - X = a , Y = d , Z = e
    alínea b):
        - 2 vezes
*/