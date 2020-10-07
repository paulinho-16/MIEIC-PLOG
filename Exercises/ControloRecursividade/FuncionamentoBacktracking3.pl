exec(X,Y) :- p(X,Y).
exec(X,X) :- s(X).

p(X,Y) :- q(X), r(Y).
p(X,Y) :- s(X), r(Y).

q(a).
q(b).

r(c).
r(d).

s(e).

/*
                                                exec(X, Y)
                                                /       \
                                       exec(X, Y)       exec(X, X)
                                        /                       \
                                  p(X, Y)                       s(X)
                                /         \                        \
                        q(X), r(Y)        s(X), r(Y)               s(e)
                        /         \       /        \
                     q(a)         r(c)   s(e)      r(c)
                     q(a)         r(d)   s(e)      r(d)
                     q(b)         r(c)
                     q(b)         r(d)

    Soluções:
        - X = a, Y = c
        - X = a, Y = d
        - X = b, Y = c
        - X = b, Y = d
        - X = e, Y = c
        - X = e, Y = d
        - X = e, Y = e
*/