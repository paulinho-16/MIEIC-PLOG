/*
    A :- B, C, !, D, E.
    A :- F, G.

    O Cut (!) é um operador que sucede quando percorrido no sentido normal da execução, mas falha no backtracking.
    Na primeira cláusula, recebido A, o programa tentará provar B e C. Se ambos sucederem, irá tentar provar D e E.
    Caso D ou E falhem, inicia-se backtracking, que pára no Cut, pelo que a próxima cláusula não será tentada.
    Já no caso de B ou C falharem, como ainda não passou pelo Cut, o programa tentará a segunda cláusula, onde vai tentar provar F e G.
    Desta forma, pode-se dizer que se trata de uma implementação de um if/else em Prolog, do género:
     "if (B AND C) -> prove(D AND E)"
     "else -> prove(F AND G)"
*/