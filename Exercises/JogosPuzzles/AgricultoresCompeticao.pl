produto(cebolas).
produto(aboboras).
produto(ovos).
produto(melancias).

nome(ana).
nome(bruno).
nome(carolina).
nome(diana).

sobrenome(almeida).
sobrenome(bernardes).
sobrenome(castro).
sobrenome(damasio).

% agricultores(Lista) -> devolve em Lista o ranking dos agricultores que competiram, apresentado para cada um a respetiva informação no formato Nome-Sobrenome-Produto-Lugar
agricultores(Lista) :-
    Lista = [
        Nome1-Sobrenome1-Produto1-1,
        Nome2-Sobrenome2-Produto2-2,
        Nome3-Sobrenome3-Produto3-3,
        Nome4-Sobrenome4-Produto4-4
    ],
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4),
    Nome1 \= Nome2, Nome1 \= Nome3, Nome1 \= Nome4, Nome2 \= Nome3, Nome2 \= Nome4, Nome3 \= Nome4,
    sobrenome(Sobrenome1), sobrenome(Sobrenome2), sobrenome(Sobrenome3), sobrenome(Sobrenome4),
    Sobrenome1 \= Sobrenome2, Sobrenome1 \= Sobrenome3, Sobrenome1 \= Sobrenome4, Sobrenome2 \= Sobrenome3, Sobrenome2 \= Sobrenome4, Sobrenome3 \= Sobrenome4,
    produto(Produto1), produto(Produto2), produto(Produto3), produto(Produto4),
    Produto1 \= Produto2, Produto1 \= Produto3, Produto1 \= Produto4, Produto2 \= Produto3, Produto2 \= Produto4, Produto3 \= Produto4,
    member(bruno-almeida-aboboras-4, Lista),
    member(NomeCastro-castro-_-1, Lista), NomeCastro \= carolina,
    member(ana-_-_-3, Lista),
    member(_-damasio-ovos-_, Lista),
    member(diana-_-ProdutoDiana-_, Lista), ProdutoDiana \= cebolas.