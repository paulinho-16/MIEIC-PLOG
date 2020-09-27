% homem(x) -> x é um homem
homem('Joao').

% mulher(x) -> x é uma mulher
mulher('Maria').
mulher('Ana').

% animal(x) -> x é um animal
animal('Cao').
animal('Gato').
animal('Tigre').

% jogo(x) -> x é um jogo
jogo('Xadrez').
jogo('Damas').

% desporto(x) -> x é um desporto
desporto('Tenis').
desporto('Natacao').

% mora_em(x, y) -> a pessoa x mora num edifício do tipo y
mora_em('Joao', 'Casa').
mora_em('Maria', 'Apartamento').
mora_em('Ana', 'Casa').

% gosta_de(x, y) -> a pessoa x gosta da coisa y
gosta_de('Joao', 'Cao').
gosta_de('Joao', 'Tigre').
gosta_de('Joao', 'Xadrez').
gosta_de('Joao', 'Tenis').
gosta_de('Maria', 'Gato').
gosta_de('Maria', 'Xadrez').
gosta_de('Maria', 'Damas').
gosta_de('Maria', 'Natacao').
gosta_de('Ana', 'Tigre').
gosta_de('Ana', 'Tenis').
gosta_de('Ana', 'Natacao').

% gosta_animais(Pessoa) -> a pessoa Pessoa gosta de animais
gosta_animais(Pessoa) :- gosta_de(Pessoa, Coisa), animal(Coisa).

% gosta_jogos(Pessoa) -> a pessoa Pessoa gosta de jogos
gosta_jogos(Pessoa) :- gosta_de(Pessoa, Coisa), jogo(Coisa).

% gosta_desportos(Pessoa) -> a pessoa Pessoa gosta de desportos
gosta_desportos(Pessoa) :- gosta_de(Pessoa, Coisa), desporto(Coisa).

% apartamento_animais(Pessoa) -> a pessoa Pessoa mora num apartamento e gosta de animais
apartamento_animais(Pessoa) :- mora_em(Pessoa, 'Apartamento'), gosta_animais(Pessoa).

% par_casa_desportos(P1, P2) -> as pessoas P1 e P2 moram numa casa e ambas gostam de desportos
par_casa_desportos(P1, P2) :- mora_em(P1, 'Casa'), mora_em(P2, 'Casa'), gosta_desportos(P1), gosta_desportos(P2).

% mulher_tenis_tigre -> true se existir alguma mulher que goste de Ténis e de Tigres
mulher_tenis_tigre :- mulher(Pessoa), gosta_de(Pessoa, 'Tenis'), gosta_de(Pessoa, 'Tigre').

/*
    alínea a):
        - apartamento_animais(Pessoa).
    alínea b):
        - par_casa_desportos('Joao', 'Maria').
    alínea c):
        - gosta_jogos(Pessoa), gosta_desportos(Pessoa).
    alínea d):
        - mulher_tenis_tigre.
*/