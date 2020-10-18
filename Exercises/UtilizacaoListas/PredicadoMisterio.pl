misterio([],[]).
misterio([X],[X]).
misterio([X,Y|L],[X,censurado|M]):- misterio(L,M).

/*
    alínea a):
        - O predicado censura as palavras que se encontram em índices ímpares da lista, substituindo-as por 'censurado'
    alínea b):
        - Como a cada iteração do predicado são removidos 2 elementos da lista, são necessários
        2 casos base. Um deles seria para o caso de a lista inicial ter um número de elementos par (o das listas vazias),
        e o outro para o caso de ter um número de elementos ímpar (na última iteração a lista teria um só elemento).
        Ou seja, a existência destes 2 casos base permite que a Lista introduzida tenha um qualquer número de elementos, seja ele par ou ímpar.
*/