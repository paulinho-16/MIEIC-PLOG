% isosceles(X) -> verdadeiro se X é um triângulo isósceles. X deve estar na forma triangulo((x1,y1), (x2,y2), (x3,y3))
% exemplo: isosceles(triangulo((1,1), (1,2), (2,2))).
isosceles(X) :-
    X = triangulo((X1, Y1), (X2, Y2), (X3, Y3)),
    comprimento((X1, Y1), (X2, Y2), C12),
    comprimento((X2, Y2), (X3, Y3), C23),
    comprimento((X1, Y1), (X3, Y3), C13),
    igual_isosceles(C12, C23, C13).

comprimento(Ponto1, Ponto2, Comprimento) :-
    Ponto1 = (X1, Y1),
    Ponto2 = (X2, Y2),
    Comprimento is sqrt((X1-X2)*(X1-X2) + (Y1-Y2)*(Y1-Y2)).

igual_isosceles(C1, C2, C3) :- C1 == C2, C1 \= C3.
igual_isosceles(C1, C2, C3) :- C2 == C3, C2 \= C1.
igual_isosceles(C1, C2, C3) :- C1 == C3, C1 \= C2.

% casa(T, Q) -> determina se o triângulo T e o quadrado Q formam uma casa. T deve estar na forma triangulo((x1,y1), (x2,y2), (x3,y3)) e Q na forma retangulo((x1,y1), (x2,y2), (x3,y3), (x4,y4))
% exemplo: casa(triangulo((1,1), (1,2), (3,3)), retangulo((1,1), (1,2), (2,2), (2,1))).
casa(T, Q) :-
    T = triangulo((X1, Y1), (X2, Y2), (X3, Y3)),
    Q = retangulo((QX1, QY1), (QX2, QY2), (QX3, QY3), (QX4, QY4)),
    quadrado(Q),
    casa_igual((X1, Y1), (X2, Y2), (X3, Y3), (QX1, QY1), (QX2, QY2), (QX3, QY3), (QX4, QY4)).

quadrado(Q) :-
    Q = retangulo((QX1, QY1), (QX2, QY2), (QX3, QY3), (QX4, QY4)),
    comprimento((QX1, QY1), (QX2, QY2), L12),
    comprimento((QX2, QY2), (QX3, QY3), L23),
    comprimento((QX3, QY3), (QX4, QY4), L34),
    comprimento((QX1, QY1), (QX4, QY4), L14),
    L12 == L23,
    L12 == L34,
    L12 == L14.

casa_igual(T1, T2, T3, Q1, Q2, Q3, Q4) :-
    ((T1 == Q1, T2 == Q2) ; (T1 == Q2, T2 == Q3) ; (T1 == Q3, T2 == Q4) ; (T1 == Q1, T2 == Q4)),
    T3 \= Q1, T3 \= Q2, T3 \= Q3, T3 \= Q4.

casa_igual(T1, T2, T3, Q1, Q2, Q3, Q4) :-
    ((T1 == Q2, T2 == Q1) ; (T1 == Q3, T2 == Q2) ; (T1 == Q4, T2 == Q3) ; (T1 == Q4, T2 == Q1)),
    T3 \= Q1, T3 \= Q2, T3 \= Q3, T3 \= Q4.

casa_igual(T1, T2, T3, Q1, Q2, Q3, Q4) :-
    ((T2 == Q1, T3 == Q2) ; (T2 == Q2, T3 == Q3) ; (T2 == Q3, T3 == Q4) ; (T2 == Q1, T3 == Q4)),
    T1 \= Q1, T1 \= Q2, T1 \= Q3, T1 \= Q4.

casa_igual(T1, T2, T3, Q1, Q2, Q3, Q4) :-
    ((T2 == Q2, T3 == Q1) ; (T2 == Q3, T3 == Q2) ; (T2 == Q4, T3 == Q3) ; (T2 == Q4, T3 == Q1)),
    T1 \= Q1, T1 \= Q2, T1 \= Q3, T1 \= Q4.

casa_igual(T1, T2, T3, Q1, Q2, Q3, Q4) :-
    ((T1 == Q1, T3 == Q2) ; (T1 == Q2, T3 == Q3) ; (T1 == Q3, T3 == Q4) ; (T1 == Q1, T3 == Q4)),
    T2 \= Q1, T2 \= Q2, T2 \= Q3, T2 \= Q4.

casa_igual(T1, T2, T3, Q1, Q2, Q3, Q4) :-
    ((T1 == Q2, T3 == Q1) ; (T1 == Q3, T3 == Q2) ; (T1 == Q4, T3 == Q3) ; (T1 == Q4, T3 == Q1)),
    T2 \= Q1, T2 \= Q2, T2 \= Q3, T2 \= Q4.