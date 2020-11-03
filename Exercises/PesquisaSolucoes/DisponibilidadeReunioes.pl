disponibilidade(pedro, [disp(2,4), disp(12,20), disp(25,28)]).
disponibilidade(paulo, [disp(4,6), disp(14,20), disp(23,27)]).

% disponiveis_dia(Dia, Pessoas) -> retorna todos os nomes de pessoas disponíveis para uma reunião (Pessoas) num determinado Dia
disponiveis_dia(Dia, Pessoas) :- findall(Pessoa, esta_disponivel(Dia, Pessoa), Pessoas).

% esta_disponivel(Dia, Pessoa) -> sucesso se a pessoa Pessoa está disponível no dia Dia
esta_disponivel(Dia, Pessoa) :-
    disponibilidade(Pessoa, Lista),
    contem_dia(Dia, Lista).

% contem_dia(Dia, Lista) -> sucesso se a lista de disponibilidades Lista contém o dia Dia
contem_dia(Dia, [disp(Initial, Final)|_]) :- Dia >= Initial, Dia =< Final.
contem_dia(Dia, [_|Lista]) :- contem_dia(Dia, Lista).

% --------------------- %

% possibilidades_reuniao(Pessoas, Minimo, Possibilidades) -> retorna todas as Possibilidades de realização de uma reunião, de forma a envolver todas as pessoas Pessoas, e a cumprir um número mínimo Minimo de dias consecutivos para a sua realização
possibilidades_reuniao(Pessoas, Minimo, Possibilidades) :- poss_reuniao(Pessoas, Minimo, Minimo, [], 1, 1, Possibilidades, []).

poss_reuniao(_, _, _, _, 32, _, Possibilidades, Possibilidades). % termina quando experimentou todos os dias como FirstDia

poss_reuniao(Pessoas, Minimo, 0, LAcc, FirstDia, Dia, Possibilidades, Poss) :- % caso em que encontrou uma possibilidade
    disponiveis_dia(Dia, PessoasDisponiveis),
    compare(=, Pessoas, PessoasDisponiveis),
    append(LAcc, [Dia], NewLAcc),
    append(Poss, [NewLAcc], NovasPoss),
    NovoFirstDia is FirstDia + 1,
    poss_reuniao(Pessoas, Minimo, Minimo, [], NovoFirstDia, NovoFirstDia, Possibilidades, NovasPoss), !.

poss_reuniao(Pessoas, Minimo, 0, _, FirstDia, Dia, Possibilidades, Poss) :- % caso em que a possibilidade só falhou por 1 dia (ignorar possibilidade)
    disponiveis_dia(Dia, PessoasDisponiveis),
    \+ compare(=, Pessoas, PessoasDisponiveis),
    NovoFirstDia is FirstDia + 1,
    poss_reuniao(Pessoas, Minimo, Minimo, [], NovoFirstDia, NovoFirstDia, Possibilidades, Poss), !.

poss_reuniao(Pessoas, Minimo, NovoMinimo, _, FirstDia, Dia, Possibilidades, Poss) :- % caso em que a possibilidade falhou (ignorar possibilidade)
    Dia < 32,
    NovoMinimo > 0,
    disponiveis_dia(Dia, PessoasDisponiveis),
    \+ compare(=, Pessoas, PessoasDisponiveis),
    NovoFirstDia is FirstDia + 1,
    poss_reuniao(Pessoas, Minimo, Minimo, [], NovoFirstDia, NovoFirstDia, Possibilidades, Poss), !.

poss_reuniao(Pessoas, Minimo, Minimo, LAcc, _, Dia, Possibilidades, Poss) :- % caso em que se inicia uma nova possibilidade
    NovoMinimo is Minimo - 1,
    append(LAcc, [Dia], NewLAcc),
    NovoDia is Dia + 1,
    poss_reuniao(Pessoas, Minimo, NovoMinimo, NewLAcc, Dia, NovoDia, Possibilidades, Poss), !.

poss_reuniao(Pessoas, Minimo, NovoMinimo, LAcc, FirstDia, Dia, Possibilidades, Poss) :- % caso em que se acrescenta mais um dia possível à possibilidade
    NovoMinimo > 0,
    NovoMinimo2 is NovoMinimo - 1,
    NovoDia is Dia + 1,
    poss_reuniao(Pessoas, Minimo, NovoMinimo2, LAcc, FirstDia, NovoDia, Possibilidades, Poss), !.