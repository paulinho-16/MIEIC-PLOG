:- use_module(library(clpfd)).

nome(0, 'Maria').
nome(1, 'Joao').

tarefa(1, 'Compras').
tarefa(2, 'Cozinha').
tarefa(3, 'Lavagem').
tarefa(4, 'Limpeza').

% tarefas_domesticas(Tasks, Time) -> resolve o problema das tarefas domésticas, devolvendo em Tasks os números correspondentes a quem faz a tarefa, e em Time o tempo total necessário para as fazer
tarefas_domesticas(Tasks, Time) :-
    length(Tasks, 4),
    global_cardinality(Tasks, [0-2, 1-2]),
    TimesJoao = [49, 72, 43, 31],
    TimesMaria = [45, 78, 36, 29],
    time(Tasks, TimesJoao, TimesMaria, Time),
    labeling([minimize(Time)], Tasks),
    escrever(1, Tasks).

time([], _, _, 0).
time([H | T], [TJ | TasksJoao], [TM | TasksMaria], Time) :-
    H #= 1 #<=> J,
    time(T, TasksJoao, TasksMaria, Rest),
    Time #= TJ * J + TM * (1 - J) + Rest.

escrever(_, []).
escrever(N, [Task|Tasks]) :-
    nome(Task, Nome),
    tarefa(N, NomeTask),
    N1 is N + 1,
    write(Nome), write(' fez a tarefa '), write(NomeTask), nl,
    escrever(N1, Tasks).