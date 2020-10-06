% comprou(x, y) -> a pessoa x comprou o carro da marca y
comprou(joao, honda).
comprou(joao, uno).

% ano(x, y) -> o carro da marca x foi fabricado no ano y
ano(honda, 1997).
ano(uno, 1998).

% valor(x, y) -> o valor do carro da marca x é y euros
valor(honda, 20000).
valor(uno, 7000).

% diferenca(Ano_Atual, Ano) -> sucesso se o Ano_Atual for maior ou igual do que Ano e se a diferença entre eles for menor ou igual a 10 anos
diferenca(Ano_Atual, Ano) :- Ano_Atual >= Ano, (Ano_Atual - Ano) =< 10.

% pode_vender(Pessoa, Carro, Ano_Atual) -> a pessoa Pessoa pode vender o carro Carro se o carro for comprado por ela nos últimos 10 anos e se o seu valor for menor do que 10000 euros
pode_vender(Pessoa, Carro, Ano_Atual) :-
    comprou(Pessoa, Carro),
    ano(Carro, Ano),
    diferenca(Ano_Atual, Ano),
    valor(Carro, Valor),
    Valor < 10000.