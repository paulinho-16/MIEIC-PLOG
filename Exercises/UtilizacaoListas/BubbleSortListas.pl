% bubble_sort(List, Sorted) -> ordena a lista List usando o método Bubble Sort, armazenando o resultado em Sorted
bubble_sort(List, Sorted) :- b_sort(List, [], Sorted).

b_sort([], Sorted, Sorted).
b_sort([X|List], LAcc, Sorted) :-
    bubble(X, List, NewList, Max),
    b_sort(NewList, [Max|LAcc], Sorted).

bubble(X, [], [], X).
bubble(X, [Y|T], [Y|NT], Max) :-
    X > Y,
    bubble(X, T, NT, Max).
bubble(X, [Y|T], [X|NT], Max) :-
    X =< Y,
    bubble(Y, T, NT, Max).