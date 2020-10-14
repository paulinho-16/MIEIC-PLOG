% before(A, B, L) -> sucesso se A e B forem membros da lista L, e pelo menos uma ocorrência de A ocorrer na lista antes de outra ocorrência de B
before(A, B, L) :- append(_, [A|T], L), append(_, [B|_], T).

% beforeNovo(A, B, L) -> sucesso se A e B forem membros da lista L, e a primeira ocorrência de A ocorrer antes de qualquer ocorrência de B
% (matéria não dada) - fonte: https://stackoverflow.com/questions/33633942/prolog-x-before-y-in-a-list
beforeNovo(A, B, L) :- phrase(beforeNovo(A,B), L).

beforeNovo(A, B) --> anything_but(B), [A], ref, [B], ref.
anything_but(_) --> [].
anything_but(Y) --> [X], {dif(X, Y)}, anything_but(Y).

anything_but(_) --> [].
anything_but(Y) --> [X], { dif(X, Y) }, anything_but(Y).

ref --> [].
ref --> [_], rev.