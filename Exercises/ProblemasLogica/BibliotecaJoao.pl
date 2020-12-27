:- use_module(library(clpfd)).
:- use_module(library(lists)).

livro(1, ' livros de Historia em Ingles encadernados com capa comum').
livro(2, ' livros de Historia em Frances encadernados com capa comum').
livro(3, ' livros de Literatura em Ingles encadernados com capa comum').
livro(4, ' livros de Literatura em Frances encadernados com capa comum').
livro(5, ' livros de Historia em Ingles encadernados com capa dura').
livro(6, ' livros de Historia em Frances encadernados com capa dura').
livro(7, ' livros de Literatura em Ingles encadernados com capa dura').
livro(8, ' livros de Literatura em Frances encadernados com capa dura').

% biblioteca -> resolve o problema da biblioteca do João, com base na informação dada
biblioteca :-
    Livros = [ComumHistEN, ComumHistFR, ComumLitEN, ComumLitFR, DuraHistEN, DuraHistFR, DuraLitEN, DuraLitFR],
    domain(Livros, 0, 300),
    ComumHistEN + ComumHistFR + DuraHistEN + DuraHistFR #= 52,
    ComumHistEN + DuraHistEN #= 27,
    DuraHistEN + DuraHistFR + DuraLitEN + DuraLitFR #= 34,
    DuraHistFR #= 3,
    ComumHistEN + ComumLitEN + DuraHistEN + DuraLitEN #= 46,
    ComumHistEN + ComumLitEN #= 23,
    ComumLitFR + DuraLitFR #= 20,
    ComumLitEN + ComumLitFR #= 31,
    labeling([], Livros),
    escrever(Livros, 1),
    sumlist(Livros, Total), nl,
    write('Ao todo, o Joao tem '), write(Total), write(' livros'), nl.

escrever([], _).
escrever([Nr|Livros], N) :-
    livro(N, String),
    write(Nr), write(String), nl,
    N1 is N + 1,
    escrever(Livros, N1).