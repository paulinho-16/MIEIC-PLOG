:- use_module(library(clpfd)).

flatten([], []).
flatten([H | T], FlatBoard):-
    flatten(T, NewFlat),
    append(H, NewFlat, FlatBoard).

% zebra(Zeb,Agu) -> resolve o conhecido problema "Zebra Puzzle", devolvendo em Zeb o número da casa onde vive a zebra, e em Agu o número da casa onde se bebe água, apresentando também os dados de todas as casas
zebra(Zeb, Agu) :-
    % Definição das Variáveis e Domínios
    Sol = [Nac, Ani, Beb, Cor, Tab],
    Nac = [Ing, Esp, Nor, Ucr, Por],
    Ani = [Cao, Rap, Igu, Cav, Zeb],
    Beb = [Sum, Cha, Caf, Lei, Agu],
    Cor = [Verm, Verd, Bran, Amar, Azul],
    Tab = [Che, Win, LS, SG, Mar],
    flatten(Sol, List),
    domain(List, 1, 5),
    % Colocação das Restrições
    all_different(Nac),
    all_different(Ani),
    all_different(Beb),
    all_different(Cor),
    all_different(Tab),
    Ing #= Verm,
    Esp #= Cao,
    Nor #= 1,
    Amar #= Mar,
    abs(Che-Rap) #= 1,
    abs(Nor-Azul) #= 1,
    Win #= Igu,
    LS #= Sum,
    Ucr #= Cha,
    Por #= SG,
    abs(Mar-Cav) #= 1,
    Verd #= Caf,
    Verd #= Bran+1,
    Lei #= 3,
    % Pesquisa da solução
    labeling([], List),
    write(['Nacionalidades', 'Animais', 'Bebidas', 'Cores', 'Tabaco']), nl,
    write(Sol), nl.