% comida(x) -> x é uma comida
comida('Peru').
comida('Frango').
comida('Salmao').
comida('Solha').

% bebida(x) -> x é uma bebida
bebida('Cerveja').
bebida('Vinho Verde').
bebida('Vinho Maduro').

% pessoa(x) -> x é uma pessoa
pessoa('Ana').
pessoa('Antonio').
pessoa('Barbara').
pessoa('Bruno').

% gosta(x, y) -> a pessoa x gosta da comida/bebida y
gosta('Ana', 'Frango').
gosta('Ana', 'Salmao').
gosta('Ana', 'Vinho Verde').
gosta('Antonio', 'Salmao').
gosta('Antonio', 'Solha').
gosta('Antonio', 'Cerveja').
gosta('Antonio', 'Vinho Maduro').
gosta('Barbara', 'Frango').
gosta('Barbara', 'Salmao').
gosta('Barbara', 'Solha').
gosta('Barbara', 'Vinho Maduro').
gosta('Bruno', 'Peru').
gosta('Bruno', 'Frango').
gosta('Bruno', 'Salmao').
gosta('Bruno', 'Vinho Verde').
gosta('Bruno', 'Vinho Maduro').

% casado(x, y) -> a pessoa x é casada com a pessoa y
casado('Ana', 'Bruno').
casado('Bruno', 'Ana').
casado('Barbara', 'Antonio').
casado('Antonio', 'Barbara').

% combina(x, y) -> a comida x combina com a bebida y
combina('Peru', 'Vinho Maduro').
combina('Frango', 'Cerveja').
combina('Salmao', 'Vinho Verde').
combina('Solha', 'Vinho Verde').

% casal_alimento(P1, P2, A) -> P1 e P2 são casados, e ambos gostam do alimento A
casal_alimento(P1, P2, A) :- casado(P1, P2), gosta(P1, A), gosta(P2, A).

/*
    alínea a):
        - casal_alimento('Ana', 'Bruno', 'Vinho Verde').
    alínea b):
        - combina('Salmao', Bebida).
    alínea c):
        - combina(Comida, 'Vinho Verde').
*/