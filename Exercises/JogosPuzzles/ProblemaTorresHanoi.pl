% hanoi(Num, Pino1, Pino2, Pino3, Movimentos) -> devolve em Movimentos a sequência de movimentos necessária para resolver o problema das torres de Hanoi com Num discos (passar toda a pilha de discos do Pino 1 para o Pino 2, pela mesma ordem)
hanoi(1, Pino1, Pino2, _, [m(Pino1, Pino2)]).
hanoi(Num, Pino1, Pino2, Pino3, Movimentos) :-
    Num > 1,
    Num1 is Num - 1,
    hanoi(Num1, Pino1, Pino3, Pino2, Mov1),
    hanoi(1, Pino1, Pino2, _, Mov2),
    hanoi(Num1, Pino3, Pino2, Pino1, Mov3),
    append(Mov1, Mov2, Mov12),
    append(Mov12, Mov3, Movimentos).