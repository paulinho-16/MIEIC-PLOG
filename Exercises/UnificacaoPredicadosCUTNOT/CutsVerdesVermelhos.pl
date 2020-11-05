imaturo(X):- adulto(X), !, fail.
imaturo(_).

adulto(X):- pessoa(X), !, idade(X, N), N>=18.
adulto(X):- tartaruga(X), !, idade(X, N), N>=50.

/*
    O Cut no predicado imaturo(X) funciona como o predicado Not. Se X for adulto, então não é imaturo.
    Caso contrário, é imaturo. Trata-se de um Cut Vermelho pois é essencial para o funcionamento do programa.

    O Cut em adulto(X) evita explorar espaço de pesquisa em que é impossível estar a solução.
    Se X for uma pessoa, então só será adulto se tiver uma idade maior ou igual a 18.
    Só se X não for uma pessoa é que se vai verificar se X é uma tartaruga.
    Trata-se de um Cut Verde pois não altera as soluções obtidas, mas sim a eficiência do programa.
*/