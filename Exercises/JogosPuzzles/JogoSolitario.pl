:- op(300, xfy, :).

% Solution doesn't work

solitario(CasaLivre) :-
    casas_do_jogo(Casas),
    remove(CasaLivre, Casas, CasasOcupadas),
    descobre_movimentos(CasasOcupadas, [CasaLivre], Movs),
    imprime(Movs), nl.
solitario(_) :-
    nl, write('Não me é possível resolver essa questão').

descobre_movimentos([_X],_,[]).  % Só uma casa ocupada
descobre_movimentos(CasasOcup, CasasLivres, [M|Movs]) :-
    seleciona_mov(M, CasasOcup, NCasasOcup, CasasLivres, NCasasLivres),
    descobre_movimentos(NCasasOcup, NCasasLivres, Movs).

seleciona_mov(A:B:C, CO, CL, NCO, NCL) :-
    A:B:C,
    remove(A, CO, NCO1),
    remove(B, NCO1, NCO2),
    remove(C, CL, NCL1),
    adiciona(C, NCO2, NCO),
    adiciona(A, NCL1, NCL2),
    adiciona(B, NCL2, NCL).

adiciona(X, [], [X]).
adiciona(X, [L|R], [L|V]) :- adiciona(X, R, V).

remove(X, [X|V], V) :- !.
remove(X, [Y|R], [Y|V]) :- remove(X, R, V).

imprime([A:B:C]) :-
    write('De '), write(A), write(' para '), write(C),
    write(' comendo '), write(B), nl.
imprime([Mov|Movs]) :-
    imprime([Mov]), imprime(Movs).

a:a:a. a:a:b. a:a:c. a:a:d. a:a:e. a:a:f. a:a:g. a:a:h. a:a:i. a:a:j. a:a:k. a:a:l. a:a:m. a:a:n. a:a:o. a:b:a. a:b:b. a:b:c. a:b:d. a:b:e. a:b:f. a:b:g. a:b:h. a:b:i. a:b:j. a:b:k. a:b:l. a:b:m. a:b:n. a:b:o. a:c:a. a:c:b. a:c:c. a:c:d. a:c:e. a:c:f. a:c:g. a:c:h. a:c:i. a:c:j. a:c:k. a:c:l. a:c:m. a:c:n. a:c:o. a:d:a. a:d:b. a:d:c. a:d:d. a:d:e. a:d:f. a:d:g. a:d:h. a:d:i. a:d:j. a:d:k. a:d:l. a:d:m. a:d:n. a:d:o. a:e:a. a:e:b. a:e:c. a:e:d. a:e:e. a:e:f. a:e:g. a:e:h. a:e:i. a:e:j. a:e:k. a:e:l. a:e:m. a:e:n. a:e:o. a:f:a. a:f:b. a:f:c. a:f:d. a:f:e. a:f:f. a:f:g. a:f:h. a:f:i. a:f:j. a:f:k. a:f:l. a:f:m. a:f:n. a:f:o. a:g:a. a:g:b. a:g:c. a:g:d. a:g:e. a:g:f. a:g:g. a:g:h. a:g:i. a:g:j. a:g:k. a:g:l. a:g:m. a:g:n. a:g:o. a:h:a. a:h:b. a:h:c. a:h:d. a:h:e. a:h:f. a:h:g. a:h:h. a:h:i. a:h:j. a:h:k. a:h:l. a:h:m. a:h:n. a:h:o. a:i:a. a:i:b. a:i:c. a:i:d. a:i:e. a:i:f. a:i:g. a:i:h. a:i:i. a:i:j. a:i:k. a:i:l. a:i:m. a:i:n. a:i:o. a:j:a. a:j:b. a:j:c. a:j:d. a:j:e. a:j:f. a:j:g. a:j:h. a:j:i. a:j:j. a:j:k. a:j:l. a:j:m. a:j:n. a:j:o. a:k:a. a:k:b. a:k:c. a:k:d. a:k:e. a:k:f. a:k:g. a:k:h. a:k:i. a:k:j. a:k:k. a:k:l. a:k:m. a:k:n. a:k:o. a:l:a. a:l:b. a:l:c. a:l:d. a:l:e. a:l:f. a:l:g. a:l:h. a:l:i. a:l:j. a:l:k. a:l:l. a:l:m. a:l:n. a:l:o. a:m:a. a:m:b. a:m:c. a:m:d. a:m:e. a:m:f. a:m:g. a:m:h. a:m:i. a:m:j. a:m:k. a:m:l. a:m:m. a:m:n. a:m:o. a:n:a. a:n:b. a:n:c. a:n:d. a:n:e. a:n:f. a:n:g. a:n:h. a:n:i. a:n:j. a:n:k. a:n:l. a:n:m. a:n:n. a:n:o. a:o:a. a:o:b. a:o:c. a:o:d. a:o:e. a:o:f. a:o:g. a:o:h. a:o:i. a:o:j. a:o:k. a:o:l. a:o:m. a:o:n. a:o:o. b:a:a. b:a:b. b:a:c. b:a:d. b:a:e. b:a:f. b:a:g. b:a:h. b:a:i. b:a:j. b:a:k. b:a:l. b:a:m. b:a:n. b:a:o. b:b:a. b:b:b. b:b:c. b:b:d. b:b:e. b:b:f. b:b:g. b:b:h. b:b:i. b:b:j. b:b:k. b:b:l. b:b:m. b:b:n. b:b:o. b:c:a. b:c:b. b:c:c. b:c:d. b:c:e. b:c:f. b:c:g. b:c:h. b:c:i. b:c:j. b:c:k. b:c:l. b:c:m. b:c:n. b:c:o. b:d:a. b:d:b. b:d:c. b:d:d. b:d:e. b:d:f. b:d:g. b:d:h. b:d:i. b:d:j. b:d:k. b:d:l. b:d:m. b:d:n. b:d:o. b:e:a. b:e:b. b:e:c. b:e:d. b:e:e. b:e:f. b:e:g. b:e:h. b:e:i. b:e:j. b:e:k. b:e:l. b:e:m. b:e:n. b:e:o. b:f:a. b:f:b. b:f:c. b:f:d. b:f:e. b:f:f. b:f:g. b:f:h. b:f:i. b:f:j. b:f:k. b:f:l. b:f:m. b:f:n. b:f:o. b:g:a. b:g:b. b:g:c. b:g:d. b:g:e. b:g:f. b:g:g. b:g:h. b:g:i. b:g:j. b:g:k. b:g:l. b:g:m. b:g:n. b:g:o. b:h:a. b:h:b. b:h:c. b:h:d. b:h:e. b:h:f. b:h:g. b:h:h. b:h:i. b:h:j. b:h:k. b:h:l. b:h:m. b:h:n. b:h:o. b:i:a. b:i:b. b:i:c. b:i:d. b:i:e. b:i:f. b:i:g. b:i:h. b:i:i. b:i:j. b:i:k. b:i:l. b:i:m. b:i:n. b:i:o. b:j:a. b:j:b. b:j:c. b:j:d. b:j:e. b:j:f. b:j:g. b:j:h. b:j:i. b:j:j. b:j:k. b:j:l. b:j:m. b:j:n. b:j:o. b:k:a. b:k:b. b:k:c. b:k:d. b:k:e. b:k:f. b:k:g. b:k:h. b:k:i. b:k:j. b:k:k. b:k:l. b:k:m. b:k:n. b:k:o. b:l:a. b:l:b. b:l:c. b:l:d. b:l:e. b:l:f. b:l:g. b:l:h. b:l:i. b:l:j. b:l:k. b:l:l. b:l:m. b:l:n. b:l:o. b:m:a. b:m:b. b:m:c. b:m:d. b:m:e. b:m:f. b:m:g. b:m:h. b:m:i. b:m:j. b:m:k. b:m:l. b:m:m. b:m:n. b:m:o. b:n:a. b:n:b. b:n:c. b:n:d. b:n:e. b:n:f. b:n:g. b:n:h. b:n:i. b:n:j. b:n:k. b:n:l. b:n:m. b:n:n. b:n:o. b:o:a. b:o:b. b:o:c. b:o:d. b:o:e. b:o:f. b:o:g. b:o:h. b:o:i. b:o:j. b:o:k. b:o:l. b:o:m. b:o:n. b:o:o. c:a:a. c:a:b. c:a:c. c:a:d. c:a:e. c:a:f. c:a:g. c:a:h. c:a:i. c:a:j. c:a:k. c:a:l. c:a:m. c:a:n. c:a:o. c:b:a. c:b:b. c:b:c. c:b:d. c:b:e. c:b:f. c:b:g. c:b:h. c:b:i. c:b:j. c:b:k. c:b:l. c:b:m. c:b:n. c:b:o. c:c:a. c:c:b. c:c:c. c:c:d. c:c:e. c:c:f. c:c:g. c:c:h. c:c:i. c:c:j. c:c:k. c:c:l. c:c:m. c:c:n. c:c:o. c:d:a. c:d:b. c:d:c. c:d:d. c:d:e. c:d:f. c:d:g. c:d:h. c:d:i. c:d:j. c:d:k. c:d:l. c:d:m. c:d:n. c:d:o. c:e:a. c:e:b. c:e:c. c:e:d. c:e:e. c:e:f. c:e:g. c:e:h. c:e:i. c:e:j. c:e:k. c:e:l. c:e:m. c:e:n. c:e:o. c:f:a. c:f:b. c:f:c. c:f:d. c:f:e. c:f:f. c:f:g. c:f:h. c:f:i. c:f:j. c:f:k. c:f:l. c:f:m. c:f:n. c:f:o. c:g:a. c:g:b. c:g:c. c:g:d. c:g:e. c:g:f. c:g:g. c:g:h. c:g:i. c:g:j. c:g:k. c:g:l. c:g:m. c:g:n. c:g:o. c:h:a. c:h:b. c:h:c. c:h:d. c:h:e. c:h:f. c:h:g. c:h:h. c:h:i. c:h:j. c:h:k. c:h:l. c:h:m. c:h:n. c:h:o. c:i:a. c:i:b. c:i:c. c:i:d. c:i:e. c:i:f. c:i:g. c:i:h. c:i:i. c:i:j. c:i:k. c:i:l. c:i:m. c:i:n. c:i:o. c:j:a. c:j:b. c:j:c. c:j:d. c:j:e. c:j:f. c:j:g. c:j:h. c:j:i. c:j:j. c:j:k. c:j:l. c:j:m. c:j:n. c:j:o. c:k:a. c:k:b. c:k:c. c:k:d. c:k:e. c:k:f. c:k:g. c:k:h. c:k:i. c:k:j. c:k:k. c:k:l. c:k:m. c:k:n. c:k:o. c:l:a. c:l:b. c:l:c. c:l:d. c:l:e. c:l:f. c:l:g. c:l:h. c:l:i. c:l:j. c:l:k. c:l:l. c:l:m. c:l:n. c:l:o. c:m:a. c:m:b. c:m:c. c:m:d. c:m:e. c:m:f. c:m:g. c:m:h. c:m:i. c:m:j. c:m:k. c:m:l. c:m:m. c:m:n. c:m:o. c:n:a. c:n:b. c:n:c. c:n:d. c:n:e. c:n:f. c:n:g. c:n:h. c:n:i. c:n:j. c:n:k. c:n:l. c:n:m. c:n:n. c:n:o. c:o:a. c:o:b. c:o:c. c:o:d. c:o:e. c:o:f. c:o:g. c:o:h. c:o:i. c:o:j. c:o:k. c:o:l. c:o:m. c:o:n. c:o:o. d:a:a. d:a:b. d:a:c. d:a:d. d:a:e. d:a:f. d:a:g. d:a:h. d:a:i. d:a:j. d:a:k. d:a:l. d:a:m. d:a:n. d:a:o. d:b:a. d:b:b. d:b:c. d:b:d. d:b:e. d:b:f. d:b:g. d:b:h. d:b:i. d:b:j. d:b:k. d:b:l. d:b:m. d:b:n. d:b:o. d:c:a. d:c:b. d:c:c. d:c:d. d:c:e. d:c:f. d:c:g. d:c:h. d:c:i. d:c:j. d:c:k. d:c:l. d:c:m. d:c:n. d:c:o. d:d:a. d:d:b. d:d:c. d:d:d. d:d:e. d:d:f. d:d:g. d:d:h. d:d:i. d:d:j. d:d:k. d:d:l. d:d:m. d:d:n. d:d:o. d:e:a. d:e:b. d:e:c. d:e:d. d:e:e. d:e:f. d:e:g. d:e:h. d:e:i. d:e:j. d:e:k. d:e:l. d:e:m. d:e:n. d:e:o. d:f:a. d:f:b. d:f:c. d:f:d. d:f:e. d:f:f. d:f:g. d:f:h. d:f:i. d:f:j. d:f:k. d:f:l. d:f:m. d:f:n. d:f:o. d:g:a. d:g:b. d:g:c. d:g:d. d:g:e. d:g:f. d:g:g. d:g:h. d:g:i. d:g:j. d:g:k. d:g:l. d:g:m. d:g:n. d:g:o. d:h:a. d:h:b. d:h:c. d:h:d. d:h:e. d:h:f. d:h:g. d:h:h. d:h:i. d:h:j. d:h:k. d:h:l. d:h:m. d:h:n. d:h:o. d:i:a. d:i:b. d:i:c. d:i:d. d:i:e. d:i:f. d:i:g. d:i:h. d:i:i. d:i:j. d:i:k. d:i:l. d:i:m. d:i:n. d:i:o. d:j:a. d:j:b. d:j:c. d:j:d. d:j:e. d:j:f. d:j:g. d:j:h. d:j:i. d:j:j. d:j:k. d:j:l. d:j:m. d:j:n. d:j:o. d:k:a. d:k:b. d:k:c. d:k:d. d:k:e. d:k:f. d:k:g. d:k:h. d:k:i. d:k:j. d:k:k. d:k:l. d:k:m. d:k:n. d:k:o. d:l:a. d:l:b. d:l:c. d:l:d. d:l:e. d:l:f. d:l:g. d:l:h. d:l:i. d:l:j. d:l:k. d:l:l. d:l:m. d:l:n. d:l:o. d:m:a. d:m:b. d:m:c. d:m:d. d:m:e. d:m:f. d:m:g. d:m:h. d:m:i. d:m:j. d:m:k. d:m:l. d:m:m. d:m:n. d:m:o. d:n:a. d:n:b. d:n:c. d:n:d. d:n:e. d:n:f. d:n:g. d:n:h. d:n:i. d:n:j. d:n:k. d:n:l. d:n:m. d:n:n. d:n:o. d:o:a. d:o:b. d:o:c. d:o:d. d:o:e. d:o:f. d:o:g. d:o:h. d:o:i. d:o:j. d:o:k. d:o:l. d:o:m. d:o:n. d:o:o. e:a:a. e:a:b. e:a:c. e:a:d. e:a:e. e:a:f. e:a:g. e:a:h. e:a:i. e:a:j. e:a:k. e:a:l. e:a:m. e:a:n. e:a:o. e:b:a. e:b:b. e:b:c. e:b:d. e:b:e. e:b:f. e:b:g. e:b:h. e:b:i. e:b:j. e:b:k. e:b:l. e:b:m. e:b:n. e:b:o. e:c:a. e:c:b. e:c:c. e:c:d. e:c:e. e:c:f. e:c:g. e:c:h. e:c:i. e:c:j. e:c:k. e:c:l. e:c:m. e:c:n. e:c:o. e:d:a. e:d:b. e:d:c. e:d:d. e:d:e. e:d:f. e:d:g. e:d:h. e:d:i. e:d:j. e:d:k. e:d:l. e:d:m. e:d:n. e:d:o. e:e:a. e:e:b. e:e:c. e:e:d. e:e:e. e:e:f. e:e:g. e:e:h. e:e:i. e:e:j. e:e:k. e:e:l. e:e:m. e:e:n. e:e:o. e:f:a. e:f:b. e:f:c. e:f:d. e:f:e. e:f:f. e:f:g. e:f:h. e:f:i. e:f:j. e:f:k. e:f:l. e:f:m. e:f:n. e:f:o. e:g:a. e:g:b. e:g:c. e:g:d. e:g:e. e:g:f. e:g:g. e:g:h. e:g:i. e:g:j. e:g:k. e:g:l. e:g:m. e:g:n. e:g:o. e:h:a. e:h:b. e:h:c. e:h:d. e:h:e. e:h:f. e:h:g. e:h:h. e:h:i. e:h:j. e:h:k. e:h:l. e:h:m. e:h:n. e:h:o. e:i:a. e:i:b. e:i:c. e:i:d. e:i:e. e:i:f. e:i:g. e:i:h. e:i:i. e:i:j. e:i:k. e:i:l. e:i:m. e:i:n. e:i:o. e:j:a. e:j:b. e:j:c. e:j:d. e:j:e. e:j:f. e:j:g. e:j:h. e:j:i. e:j:j. e:j:k. e:j:l. e:j:m. e:j:n. e:j:o. e:k:a. e:k:b. e:k:c. e:k:d. e:k:e. e:k:f. e:k:g. e:k:h. e:k:i. e:k:j. e:k:k. e:k:l. e:k:m. e:k:n. e:k:o. e:l:a. e:l:b. e:l:c. e:l:d. e:l:e. e:l:f. e:l:g. e:l:h. e:l:i. e:l:j. e:l:k. e:l:l. e:l:m. e:l:n. e:l:o. e:m:a. e:m:b. e:m:c. e:m:d. e:m:e. e:m:f. e:m:g. e:m:h. e:m:i. e:m:j. e:m:k. e:m:l. e:m:m. e:m:n. e:m:o. e:n:a. e:n:b. e:n:c. e:n:d. e:n:e. e:n:f. e:n:g. e:n:h. e:n:i. e:n:j. e:n:k. e:n:l. e:n:m. e:n:n. e:n:o. e:o:a. e:o:b. e:o:c. e:o:d. e:o:e. e:o:f. e:o:g. e:o:h. e:o:i. e:o:j. e:o:k. e:o:l. e:o:m. e:o:n. e:o:o.
f:a:a. f:a:b. f:a:c. f:a:d. f:a:e. f:a:f. f:a:g. f:a:h. f:a:i. f:a:j. f:a:k. f:a:l. f:a:m. f:a:n. f:a:o. f:b:a. f:b:b. f:b:c. f:b:d. f:b:e. f:b:f. f:b:g. f:b:h. f:b:i. f:b:j. f:b:k. f:b:l. f:b:m. f:b:n. f:b:o. f:c:a. f:c:b. f:c:c. f:c:d. f:c:e. f:c:f. f:c:g. f:c:h. f:c:i. f:c:j. f:c:k. f:c:l. f:c:m. f:c:n. f:c:o. f:d:a. f:d:b. f:d:c. f:d:d. f:d:e. f:d:f. f:d:g. f:d:h. f:d:i. f:d:j. f:d:k. f:d:l. f:d:m. f:d:n. f:d:o. f:e:a. f:e:b. f:e:c. f:e:d. f:e:e. f:e:f. f:e:g. f:e:h. f:e:i. f:e:j. f:e:k. f:e:l. f:e:m. f:e:n. f:e:o. f:f:a. f:f:b. f:f:c. f:f:d. f:f:e. f:f:f. f:f:g. f:f:h. f:f:i. f:f:j. f:f:k. f:f:l. f:f:m. f:f:n. f:f:o. f:g:a. f:g:b. f:g:c. f:g:d. f:g:e. f:g:f. f:g:g. f:g:h. f:g:i. f:g:j. f:g:k. f:g:l. f:g:m. f:g:n. f:g:o. f:h:a. f:h:b. f:h:c. f:h:d. f:h:e. f:h:f. f:h:g. f:h:h. f:h:i. f:h:j. f:h:k. f:h:l. f:h:m. f:h:n. f:h:o. f:i:a. f:i:b. f:i:c. f:i:d. f:i:e. f:i:f. f:i:g. f:i:h. f:i:i. f:i:j. f:i:k. f:i:l. f:i:m. f:i:n. f:i:o. f:j:a. f:j:b. f:j:c. f:j:d. f:j:e. f:j:f. f:j:g. f:j:h. f:j:i. f:j:j. f:j:k. f:j:l. f:j:m. f:j:n. f:j:o. f:k:a. f:k:b. f:k:c. f:k:d. f:k:e. f:k:f. f:k:g. f:k:h. f:k:i. f:k:j. f:k:k. f:k:l. f:k:m. f:k:n. f:k:o. f:l:a. f:l:b. f:l:c. f:l:d. f:l:e. f:l:f. f:l:g. f:l:h. f:l:i. f:l:j. f:l:k. f:l:l. f:l:m. f:l:n. f:l:o. f:m:a. f:m:b. f:m:c. f:m:d. f:m:e. f:m:f. f:m:g. f:m:h. f:m:i. f:m:j. f:m:k. f:m:l. f:m:m. f:m:n. f:m:o. f:n:a. f:n:b. f:n:c. f:n:d. f:n:e. f:n:f. f:n:g. f:n:h. f:n:i. f:n:j. f:n:k. f:n:l. f:n:m. f:n:n. f:n:o. f:o:a. f:o:b. f:o:c. f:o:d. f:o:e. f:o:f. f:o:g. f:o:h. f:o:i. f:o:j. f:o:k. f:o:l. f:o:m. f:o:n. f:o:o. g:a:a. g:a:b. g:a:c. g:a:d. g:a:e. g:a:f. g:a:g. g:a:h. g:a:i. g:a:j. g:a:k. g:a:l. g:a:m. g:a:n. g:a:o. g:b:a. g:b:b. g:b:c. g:b:d. g:b:e. g:b:f. g:b:g. g:b:h. g:b:i. g:b:j. g:b:k. g:b:l. g:b:m. g:b:n. g:b:o. g:c:a. g:c:b. g:c:c. g:c:d. g:c:e. g:c:f. g:c:g. g:c:h. g:c:i. g:c:j. g:c:k. g:c:l. g:c:m. g:c:n. g:c:o. g:d:a. g:d:b. g:d:c. g:d:d. g:d:e. g:d:f. g:d:g. g:d:h. g:d:i. g:d:j. g:d:k. g:d:l. g:d:m. g:d:n. g:d:o. g:e:a. g:e:b. g:e:c. g:e:d. g:e:e. g:e:f. g:e:g. g:e:h. g:e:i. g:e:j. g:e:k. g:e:l. g:e:m. g:e:n. g:e:o. g:f:a. g:f:b. g:f:c. g:f:d. g:f:e. g:f:f. g:f:g. g:f:h. g:f:i. g:f:j. g:f:k. g:f:l. g:f:m. g:f:n. g:f:o. g:g:a. g:g:b. g:g:c. g:g:d. g:g:e. g:g:f. g:g:g. g:g:h. g:g:i. g:g:j. g:g:k. g:g:l. g:g:m. g:g:n. g:g:o. g:h:a. g:h:b. g:h:c. g:h:d. g:h:e. g:h:f. g:h:g. g:h:h. g:h:i. g:h:j. g:h:k. g:h:l. g:h:m. g:h:n. g:h:o. g:i:a. g:i:b. g:i:c. g:i:d. g:i:e. g:i:f. g:i:g. g:i:h. g:i:i. g:i:j. g:i:k. g:i:l. g:i:m. g:i:n. g:i:o. g:j:a. g:j:b. g:j:c. g:j:d. g:j:e. g:j:f. g:j:g. g:j:h. g:j:i. g:j:j. g:j:k. g:j:l. g:j:m. g:j:n. g:j:o. g:k:a. g:k:b. g:k:c. g:k:d. g:k:e. g:k:f. g:k:g. g:k:h. g:k:i. g:k:j. g:k:k. g:k:l. g:k:m. g:k:n. g:k:o. g:l:a. g:l:b. g:l:c. g:l:d. g:l:e. g:l:f. g:l:g. g:l:h. g:l:i. g:l:j. g:l:k. g:l:l. g:l:m. g:l:n. g:l:o. g:m:a. g:m:b. g:m:c. g:m:d. g:m:e. g:m:f. g:m:g. g:m:h. g:m:i. g:m:j. g:m:k. g:m:l. g:m:m. g:m:n. g:m:o. g:n:a. g:n:b. g:n:c. g:n:d. g:n:e. g:n:f. g:n:g. g:n:h. g:n:i. g:n:j. g:n:k. g:n:l. g:n:m. g:n:n. g:n:o. g:o:a. g:o:b. g:o:c. g:o:d. g:o:e. g:o:f. g:o:g. g:o:h. g:o:i. g:o:j. g:o:k. g:o:l. g:o:m. g:o:n. g:o:o. h:a:a. h:a:b. h:a:c. h:a:d. h:a:e. h:a:f. h:a:g. h:a:h. h:a:i. h:a:j. h:a:k. h:a:l. h:a:m. h:a:n. h:a:o. h:b:a. h:b:b. h:b:c. h:b:d. h:b:e. h:b:f. h:b:g. h:b:h. h:b:i. h:b:j. h:b:k. h:b:l. h:b:m. h:b:n. h:b:o. h:c:a. h:c:b. h:c:c. h:c:d. h:c:e. h:c:f. h:c:g. h:c:h. h:c:i. h:c:j. h:c:k. h:c:l. h:c:m. h:c:n. h:c:o. h:d:a. h:d:b. h:d:c. h:d:d. h:d:e. h:d:f. h:d:g. h:d:h. h:d:i. h:d:j. h:d:k. h:d:l. h:d:m. h:d:n. h:d:o. h:e:a. h:e:b. h:e:c. h:e:d. h:e:e. h:e:f. h:e:g. h:e:h. h:e:i. h:e:j. h:e:k. h:e:l. h:e:m. h:e:n. h:e:o. h:f:a. h:f:b. h:f:c. h:f:d. h:f:e. h:f:f. h:f:g. h:f:h. h:f:i. h:f:j. h:f:k. h:f:l. h:f:m. h:f:n. h:f:o. h:g:a. h:g:b. h:g:c. h:g:d. h:g:e. h:g:f. h:g:g. h:g:h. h:g:i. h:g:j. h:g:k. h:g:l. h:g:m. h:g:n. h:g:o. h:h:a. h:h:b. h:h:c. h:h:d. h:h:e. h:h:f. h:h:g. h:h:h. h:h:i. h:h:j. h:h:k. h:h:l. h:h:m. h:h:n. h:h:o. h:i:a. h:i:b. h:i:c. h:i:d. h:i:e. h:i:f. h:i:g. h:i:h. h:i:i. h:i:j. h:i:k. h:i:l. h:i:m. h:i:n. h:i:o. h:j:a. h:j:b. h:j:c. h:j:d. h:j:e. h:j:f. h:j:g. h:j:h. h:j:i. h:j:j. h:j:k. h:j:l. h:j:m. h:j:n. h:j:o. h:k:a. h:k:b. h:k:c. h:k:d. h:k:e. h:k:f. h:k:g. h:k:h. h:k:i. h:k:j. h:k:k. h:k:l. h:k:m. h:k:n. h:k:o. h:l:a. h:l:b. h:l:c. h:l:d. h:l:e. h:l:f. h:l:g. h:l:h. h:l:i. h:l:j. h:l:k. h:l:l. h:l:m. h:l:n. h:l:o. h:m:a. h:m:b. h:m:c. h:m:d. h:m:e. h:m:f. h:m:g. h:m:h. h:m:i. h:m:j. h:m:k. h:m:l. h:m:m. h:m:n. h:m:o. h:n:a. h:n:b. h:n:c. h:n:d. h:n:e. h:n:f. h:n:g. h:n:h. h:n:i. h:n:j. h:n:k. h:n:l. h:n:m. h:n:n. h:n:o. h:o:a. h:o:b. h:o:c. h:o:d. h:o:e. h:o:f. h:o:g. h:o:h. h:o:i. h:o:j. h:o:k. h:o:l. h:o:m. h:o:n. h:o:o. i:a:a. i:a:b. i:a:c. i:a:d. i:a:e. i:a:f. i:a:g. i:a:h. i:a:i. i:a:j. i:a:k. i:a:l. i:a:m. i:a:n. i:a:o. i:b:a. i:b:b. i:b:c. i:b:d. i:b:e. i:b:f. i:b:g. i:b:h. i:b:i. i:b:j. i:b:k. i:b:l. i:b:m. i:b:n. i:b:o. i:c:a. i:c:b. i:c:c. i:c:d. i:c:e. i:c:f. i:c:g. i:c:h. i:c:i. i:c:j. i:c:k. i:c:l. i:c:m. i:c:n. i:c:o. i:d:a. i:d:b. i:d:c. i:d:d. i:d:e. i:d:f. i:d:g. i:d:h. i:d:i. i:d:j. i:d:k. i:d:l. i:d:m. i:d:n. i:d:o. i:e:a. i:e:b. i:e:c. i:e:d. i:e:e. i:e:f. i:e:g. i:e:h. i:e:i. i:e:j. i:e:k. i:e:l. i:e:m. i:e:n. i:e:o. i:f:a. i:f:b. i:f:c. i:f:d. i:f:e. i:f:f. i:f:g. i:f:h. i:f:i. i:f:j. i:f:k. i:f:l. i:f:m. i:f:n. i:f:o. i:g:a. i:g:b. i:g:c. i:g:d. i:g:e. i:g:f. i:g:g. i:g:h. i:g:i. i:g:j. i:g:k. i:g:l. i:g:m. i:g:n. i:g:o. i:h:a. i:h:b. i:h:c. i:h:d. i:h:e. i:h:f. i:h:g. i:h:h. i:h:i. i:h:j. i:h:k. i:h:l. i:h:m. i:h:n. i:h:o. i:i:a. i:i:b. i:i:c. i:i:d. i:i:e. i:i:f. i:i:g. i:i:h. i:i:i. i:i:j. i:i:k. i:i:l. i:i:m. i:i:n. i:i:o. i:j:a. i:j:b. i:j:c. i:j:d. i:j:e. i:j:f. i:j:g. i:j:h. i:j:i. i:j:j. i:j:k. i:j:l. i:j:m. i:j:n. i:j:o. i:k:a. i:k:b. i:k:c. i:k:d. i:k:e. i:k:f. i:k:g. i:k:h. i:k:i. i:k:j. i:k:k. i:k:l. i:k:m. i:k:n. i:k:o. i:l:a. i:l:b. i:l:c. i:l:d. i:l:e. i:l:f. i:l:g. i:l:h. i:l:i. i:l:j. i:l:k. i:l:l. i:l:m. i:l:n. i:l:o. i:m:a. i:m:b. i:m:c. i:m:d. i:m:e. i:m:f. i:m:g. i:m:h. i:m:i. i:m:j. i:m:k. i:m:l. i:m:m. i:m:n. i:m:o. i:n:a. i:n:b. i:n:c. i:n:d. i:n:e. i:n:f. i:n:g. i:n:h. i:n:i. i:n:j. i:n:k. i:n:l. i:n:m. i:n:n. i:n:o. i:o:a. i:o:b. i:o:c. i:o:d. i:o:e. i:o:f. i:o:g. i:o:h. i:o:i. i:o:j. i:o:k. i:o:l. i:o:m. i:o:n. i:o:o. j:a:a. j:a:b. j:a:c. j:a:d. j:a:e. j:a:f. j:a:g. j:a:h. j:a:i. j:a:j. j:a:k. j:a:l. j:a:m. j:a:n. j:a:o. j:b:a. j:b:b. j:b:c. j:b:d. j:b:e. j:b:f. j:b:g. j:b:h. j:b:i. j:b:j. j:b:k. j:b:l. j:b:m. j:b:n. j:b:o. j:c:a. j:c:b. j:c:c. j:c:d. j:c:e. j:c:f. j:c:g. j:c:h. j:c:i. j:c:j. j:c:k. j:c:l. j:c:m. j:c:n. j:c:o. j:d:a. j:d:b. j:d:c. j:d:d. j:d:e. j:d:f. j:d:g. j:d:h. j:d:i. j:d:j. j:d:k. j:d:l. j:d:m. j:d:n. j:d:o. j:e:a. j:e:b. j:e:c. j:e:d. j:e:e. j:e:f. j:e:g. j:e:h. j:e:i. j:e:j. j:e:k. j:e:l. j:e:m. j:e:n. j:e:o. j:f:a. j:f:b. j:f:c. j:f:d. j:f:e. j:f:f. j:f:g. j:f:h. j:f:i. j:f:j. j:f:k. j:f:l. j:f:m. j:f:n. j:f:o. j:g:a. j:g:b. j:g:c. j:g:d. j:g:e. j:g:f. j:g:g. j:g:h. j:g:i. j:g:j. j:g:k. j:g:l. j:g:m. j:g:n. j:g:o. j:h:a. j:h:b. j:h:c. j:h:d. j:h:e. j:h:f. j:h:g. j:h:h. j:h:i. j:h:j. j:h:k. j:h:l. j:h:m. j:h:n. j:h:o. j:i:a. j:i:b. j:i:c. j:i:d. j:i:e. j:i:f. j:i:g. j:i:h. j:i:i. j:i:j. j:i:k. j:i:l. j:i:m. j:i:n. j:i:o. j:j:a. j:j:b. j:j:c. j:j:d. j:j:e. j:j:f. j:j:g. j:j:h. j:j:i. j:j:j. j:j:k. j:j:l. j:j:m. j:j:n. j:j:o. j:k:a. j:k:b. j:k:c. j:k:d. j:k:e. j:k:f. j:k:g. j:k:h. j:k:i. j:k:j. j:k:k. j:k:l. j:k:m. j:k:n. j:k:o. j:l:a. j:l:b. j:l:c. j:l:d. j:l:e. j:l:f. j:l:g. j:l:h. j:l:i. j:l:j. j:l:k. j:l:l. j:l:m. j:l:n. j:l:o. j:m:a. j:m:b. j:m:c. j:m:d. j:m:e. j:m:f. j:m:g. j:m:h. j:m:i. j:m:j. j:m:k. j:m:l. j:m:m. j:m:n. j:m:o. j:n:a. j:n:b. j:n:c. j:n:d. j:n:e. j:n:f. j:n:g. j:n:h. j:n:i. j:n:j. j:n:k. j:n:l. j:n:m. j:n:n. j:n:o. j:o:a. j:o:b. j:o:c. j:o:d. j:o:e. j:o:f. j:o:g. j:o:h. j:o:i. j:o:j. j:o:k. j:o:l. j:o:m. j:o:n. j:o:o.
k:a:a. k:a:b. k:a:c. k:a:d. k:a:e. k:a:f. k:a:g. k:a:h. k:a:i. k:a:j. k:a:k. k:a:l. k:a:m. k:a:n. k:a:o. k:b:a. k:b:b. k:b:c. k:b:d. k:b:e. k:b:f. k:b:g. k:b:h. k:b:i. k:b:j. k:b:k. k:b:l. k:b:m. k:b:n. k:b:o. k:c:a. k:c:b. k:c:c. k:c:d. k:c:e. k:c:f. k:c:g. k:c:h. k:c:i. k:c:j. k:c:k. k:c:l. k:c:m. k:c:n. k:c:o. k:d:a. k:d:b. k:d:c. k:d:d. k:d:e. k:d:f. k:d:g. k:d:h. k:d:i. k:d:j. k:d:k. k:d:l. k:d:m. k:d:n. k:d:o. k:e:a. k:e:b. k:e:c. k:e:d. k:e:e. k:e:f. k:e:g. k:e:h. k:e:i. k:e:j. k:e:k. k:e:l. k:e:m. k:e:n. k:e:o. k:f:a. k:f:b. k:f:c. k:f:d. k:f:e. k:f:f. k:f:g. k:f:h. k:f:i. k:f:j. k:f:k. k:f:l. k:f:m. k:f:n. k:f:o. k:g:a. k:g:b. k:g:c. k:g:d. k:g:e. k:g:f. k:g:g. k:g:h. k:g:i. k:g:j. k:g:k. k:g:l. k:g:m. k:g:n. k:g:o. k:h:a. k:h:b. k:h:c. k:h:d. k:h:e. k:h:f. k:h:g. k:h:h. k:h:i. k:h:j. k:h:k. k:h:l. k:h:m. k:h:n. k:h:o. k:i:a. k:i:b. k:i:c. k:i:d. k:i:e. k:i:f. k:i:g. k:i:h. k:i:i. k:i:j. k:i:k. k:i:l. k:i:m. k:i:n. k:i:o. k:j:a. k:j:b. k:j:c. k:j:d. k:j:e. k:j:f. k:j:g. k:j:h. k:j:i. k:j:j. k:j:k. k:j:l. k:j:m. k:j:n. k:j:o. k:k:a. k:k:b. k:k:c. k:k:d. k:k:e. k:k:f. k:k:g. k:k:h. k:k:i. k:k:j. k:k:k. k:k:l. k:k:m. k:k:n. k:k:o. k:l:a. k:l:b. k:l:c. k:l:d. k:l:e. k:l:f. k:l:g. k:l:h. k:l:i. k:l:j. k:l:k. k:l:l. k:l:m. k:l:n. k:l:o. k:m:a. k:m:b. k:m:c. k:m:d. k:m:e. k:m:f. k:m:g. k:m:h. k:m:i. k:m:j. k:m:k. k:m:l. k:m:m. k:m:n. k:m:o. k:n:a. k:n:b. k:n:c. k:n:d. k:n:e. k:n:f. k:n:g. k:n:h. k:n:i. k:n:j. k:n:k. k:n:l. k:n:m. k:n:n. k:n:o. k:o:a. k:o:b. k:o:c. k:o:d. k:o:e. k:o:f. k:o:g. k:o:h. k:o:i. k:o:j. k:o:k. k:o:l. k:o:m. k:o:n. k:o:o. l:a:a. l:a:b. l:a:c. l:a:d. l:a:e. l:a:f. l:a:g. l:a:h. l:a:i. l:a:j. l:a:k. l:a:l. l:a:m. l:a:n. l:a:o. l:b:a. l:b:b. l:b:c. l:b:d. l:b:e. l:b:f. l:b:g. l:b:h. l:b:i. l:b:j. l:b:k. l:b:l. l:b:m. l:b:n. l:b:o. l:c:a. l:c:b. l:c:c. l:c:d. l:c:e. l:c:f. l:c:g. l:c:h. l:c:i. l:c:j. l:c:k. l:c:l. l:c:m. l:c:n. l:c:o. l:d:a. l:d:b. l:d:c. l:d:d. l:d:e. l:d:f. l:d:g. l:d:h. l:d:i. l:d:j. l:d:k. l:d:l. l:d:m. l:d:n. l:d:o. l:e:a. l:e:b. l:e:c. l:e:d. l:e:e. l:e:f. l:e:g. l:e:h. l:e:i. l:e:j. l:e:k. l:e:l. l:e:m. l:e:n. l:e:o. l:f:a. l:f:b. l:f:c. l:f:d. l:f:e. l:f:f. l:f:g. l:f:h. l:f:i. l:f:j. l:f:k. l:f:l. l:f:m. l:f:n. l:f:o. l:g:a. l:g:b. l:g:c. l:g:d. l:g:e. l:g:f. l:g:g. l:g:h. l:g:i. l:g:j. l:g:k. l:g:l. l:g:m. l:g:n. l:g:o. l:h:a. l:h:b. l:h:c. l:h:d. l:h:e. l:h:f. l:h:g. l:h:h. l:h:i. l:h:j. l:h:k. l:h:l. l:h:m. l:h:n. l:h:o. l:i:a. l:i:b. l:i:c. l:i:d. l:i:e. l:i:f. l:i:g. l:i:h. l:i:i. l:i:j. l:i:k. l:i:l. l:i:m. l:i:n. l:i:o. l:j:a. l:j:b. l:j:c. l:j:d. l:j:e. l:j:f. l:j:g. l:j:h. l:j:i. l:j:j. l:j:k. l:j:l. l:j:m. l:j:n. l:j:o. l:k:a. l:k:b. l:k:c. l:k:d. l:k:e. l:k:f. l:k:g. l:k:h. l:k:i. l:k:j. l:k:k. l:k:l. l:k:m. l:k:n. l:k:o. l:l:a. l:l:b. l:l:c. l:l:d. l:l:e. l:l:f. l:l:g. l:l:h. l:l:i. l:l:j. l:l:k. l:l:l. l:l:m. l:l:n. l:l:o. l:m:a. l:m:b. l:m:c. l:m:d. l:m:e. l:m:f. l:m:g. l:m:h. l:m:i. l:m:j. l:m:k. l:m:l. l:m:m. l:m:n. l:m:o. l:n:a. l:n:b. l:n:c. l:n:d. l:n:e. l:n:f. l:n:g. l:n:h. l:n:i. l:n:j. l:n:k. l:n:l. l:n:m. l:n:n. l:n:o. l:o:a. l:o:b. l:o:c. l:o:d. l:o:e. l:o:f. l:o:g. l:o:h. l:o:i. l:o:j. l:o:k. l:o:l. l:o:m. l:o:n. l:o:o. m:a:a. m:a:b. m:a:c. m:a:d. m:a:e. m:a:f. m:a:g. m:a:h. m:a:i. m:a:j. m:a:k. m:a:l. m:a:m. m:a:n. m:a:o. m:b:a. m:b:b. m:b:c. m:b:d. m:b:e. m:b:f. m:b:g. m:b:h. m:b:i. m:b:j. m:b:k. m:b:l. m:b:m. m:b:n. m:b:o. m:c:a. m:c:b. m:c:c. m:c:d. m:c:e. m:c:f. m:c:g. m:c:h. m:c:i. m:c:j. m:c:k. m:c:l. m:c:m. m:c:n. m:c:o. m:d:a. m:d:b. m:d:c. m:d:d. m:d:e. m:d:f. m:d:g. m:d:h. m:d:i. m:d:j. m:d:k. m:d:l. m:d:m. m:d:n. m:d:o. m:e:a. m:e:b. m:e:c. m:e:d. m:e:e. m:e:f. m:e:g. m:e:h. m:e:i. m:e:j. m:e:k. m:e:l. m:e:m. m:e:n. m:e:o. m:f:a. m:f:b. m:f:c. m:f:d. m:f:e. m:f:f. m:f:g. m:f:h. m:f:i. m:f:j. m:f:k. m:f:l. m:f:m. m:f:n. m:f:o. m:g:a. m:g:b. m:g:c. m:g:d. m:g:e. m:g:f. m:g:g. m:g:h. m:g:i. m:g:j. m:g:k. m:g:l. m:g:m. m:g:n. m:g:o. m:h:a. m:h:b. m:h:c. m:h:d. m:h:e. m:h:f. m:h:g. m:h:h. m:h:i. m:h:j. m:h:k. m:h:l. m:h:m. m:h:n. m:h:o. m:i:a. m:i:b. m:i:c. m:i:d. m:i:e. m:i:f. m:i:g. m:i:h. m:i:i. m:i:j. m:i:k. m:i:l. m:i:m. m:i:n. m:i:o. m:j:a. m:j:b. m:j:c. m:j:d. m:j:e. m:j:f. m:j:g. m:j:h. m:j:i. m:j:j. m:j:k. m:j:l. m:j:m. m:j:n. m:j:o. m:k:a. m:k:b. m:k:c. m:k:d. m:k:e. m:k:f. m:k:g. m:k:h. m:k:i. m:k:j. m:k:k. m:k:l. m:k:m. m:k:n. m:k:o. m:l:a. m:l:b. m:l:c. m:l:d. m:l:e. m:l:f. m:l:g. m:l:h. m:l:i. m:l:j. m:l:k. m:l:l. m:l:m. m:l:n. m:l:o. m:m:a. m:m:b. m:m:c. m:m:d. m:m:e. m:m:f. m:m:g. m:m:h. m:m:i. m:m:j. m:m:k. m:m:l. m:m:m. m:m:n. m:m:o. m:n:a. m:n:b. m:n:c. m:n:d. m:n:e. m:n:f. m:n:g. m:n:h. m:n:i. m:n:j. m:n:k. m:n:l. m:n:m. m:n:n. m:n:o. m:o:a. m:o:b. m:o:c. m:o:d. m:o:e. m:o:f. m:o:g. m:o:h. m:o:i. m:o:j. m:o:k. m:o:l. m:o:m. m:o:n. m:o:o. n:a:a. n:a:b. n:a:c. n:a:d. n:a:e. n:a:f. n:a:g. n:a:h. n:a:i. n:a:j. n:a:k. n:a:l. n:a:m. n:a:n. n:a:o. n:b:a. n:b:b. n:b:c. n:b:d. n:b:e. n:b:f. n:b:g. n:b:h. n:b:i. n:b:j. n:b:k. n:b:l. n:b:m. n:b:n. n:b:o. n:c:a. n:c:b. n:c:c. n:c:d. n:c:e. n:c:f. n:c:g. n:c:h. n:c:i. n:c:j. n:c:k. n:c:l. n:c:m. n:c:n. n:c:o. n:d:a. n:d:b. n:d:c. n:d:d. n:d:e. n:d:f. n:d:g. n:d:h. n:d:i. n:d:j. n:d:k. n:d:l. n:d:m. n:d:n. n:d:o. n:e:a. n:e:b. n:e:c. n:e:d. n:e:e. n:e:f. n:e:g. n:e:h. n:e:i. n:e:j. n:e:k. n:e:l. n:e:m. n:e:n. n:e:o. n:f:a. n:f:b. n:f:c. n:f:d. n:f:e. n:f:f. n:f:g. n:f:h. n:f:i. n:f:j. n:f:k. n:f:l. n:f:m. n:f:n. n:f:o. n:g:a. n:g:b. n:g:c. n:g:d. n:g:e. n:g:f. n:g:g. n:g:h. n:g:i. n:g:j. n:g:k. n:g:l. n:g:m. n:g:n. n:g:o. n:h:a. n:h:b. n:h:c. n:h:d. n:h:e. n:h:f. n:h:g. n:h:h. n:h:i. n:h:j. n:h:k. n:h:l. n:h:m. n:h:n. n:h:o. n:i:a. n:i:b. n:i:c. n:i:d. n:i:e. n:i:f. n:i:g. n:i:h. n:i:i. n:i:j. n:i:k. n:i:l. n:i:m. n:i:n. n:i:o. n:j:a. n:j:b. n:j:c. n:j:d. n:j:e. n:j:f. n:j:g. n:j:h. n:j:i. n:j:j. n:j:k. n:j:l. n:j:m. n:j:n. n:j:o. n:k:a. n:k:b. n:k:c. n:k:d. n:k:e. n:k:f. n:k:g. n:k:h. n:k:i. n:k:j. n:k:k. n:k:l. n:k:m. n:k:n. n:k:o. n:l:a. n:l:b. n:l:c. n:l:d. n:l:e. n:l:f. n:l:g. n:l:h. n:l:i. n:l:j. n:l:k. n:l:l. n:l:m. n:l:n. n:l:o. n:m:a. n:m:b. n:m:c. n:m:d. n:m:e. n:m:f. n:m:g. n:m:h. n:m:i. n:m:j. n:m:k. n:m:l. n:m:m. n:m:n. n:m:o. n:n:a. n:n:b. n:n:c. n:n:d. n:n:e. n:n:f. n:n:g. n:n:h. n:n:i. n:n:j. n:n:k. n:n:l. n:n:m. n:n:n. n:n:o. n:o:a. n:o:b. n:o:c. n:o:d. n:o:e. n:o:f. n:o:g. n:o:h. n:o:i. n:o:j. n:o:k. n:o:l. n:o:m. n:o:n. n:o:o. o:a:a. o:a:b. o:a:c. o:a:d. o:a:e. o:a:f. o:a:g. o:a:h. o:a:i. o:a:j. o:a:k. o:a:l. o:a:m. o:a:n. o:a:o. o:b:a. o:b:b. o:b:c. o:b:d. o:b:e. o:b:f. o:b:g. o:b:h. o:b:i. o:b:j. o:b:k. o:b:l. o:b:m. o:b:n. o:b:o. o:c:a. o:c:b. o:c:c. o:c:d. o:c:e. o:c:f. o:c:g. o:c:h. o:c:i. o:c:j. o:c:k. o:c:l. o:c:m. o:c:n. o:c:o. o:d:a. o:d:b. o:d:c. o:d:d. o:d:e. o:d:f. o:d:g. o:d:h. o:d:i. o:d:j. o:d:k. o:d:l. o:d:m. o:d:n. o:d:o. o:e:a. o:e:b. o:e:c. o:e:d. o:e:e. o:e:f. o:e:g. o:e:h. o:e:i. o:e:j. o:e:k. o:e:l. o:e:m. o:e:n. o:e:o. o:f:a. o:f:b. o:f:c. o:f:d. o:f:e. o:f:f. o:f:g. o:f:h. o:f:i. o:f:j. o:f:k. o:f:l. o:f:m. o:f:n. o:f:o. o:g:a. o:g:b. o:g:c. o:g:d. o:g:e. o:g:f. o:g:g. o:g:h. o:g:i. o:g:j. o:g:k. o:g:l. o:g:m. o:g:n. o:g:o. o:h:a. o:h:b. o:h:c. o:h:d. o:h:e. o:h:f. o:h:g. o:h:h. o:h:i. o:h:j. o:h:k. o:h:l. o:h:m. o:h:n. o:h:o. o:i:a. o:i:b. o:i:c. o:i:d. o:i:e. o:i:f. o:i:g. o:i:h. o:i:i. o:i:j. o:i:k. o:i:l. o:i:m. o:i:n. o:i:o. o:j:a. o:j:b. o:j:c. o:j:d. o:j:e. o:j:f. o:j:g. o:j:h. o:j:i. o:j:j. o:j:k. o:j:l. o:j:m. o:j:n. o:j:o. o:k:a. o:k:b. o:k:c. o:k:d. o:k:e. o:k:f. o:k:g. o:k:h. o:k:i. o:k:j. o:k:k. o:k:l. o:k:m. o:k:n. o:k:o. o:l:a. o:l:b. o:l:c. o:l:d. o:l:e. o:l:f. o:l:g. o:l:h. o:l:i. o:l:j. o:l:k. o:l:l. o:l:m. o:l:n. o:l:o. o:m:a. o:m:b. o:m:c. o:m:d. o:m:e. o:m:f. o:m:g. o:m:h. o:m:i. o:m:j. o:m:k. o:m:l. o:m:m. o:m:n. o:m:o. o:n:a. o:n:b. o:n:c. o:n:d. o:n:e. o:n:f. o:n:g. o:n:h. o:n:i. o:n:j. o:n:k. o:n:l. o:n:m. o:n:n. o:n:o. o:o:a. o:o:b. o:o:c. o:o:d. o:o:e. o:o:f. o:o:g. o:o:h. o:o:i. o:o:j. o:o:k. o:o:l. o:o:m. o:o:n. o:o:o.

casas_do_jogo([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o]).