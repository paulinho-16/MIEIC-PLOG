% bird(x) -> x is a bird
bird('Tweety').

% fish(x) -> x is a fish
fish('Goldie').

% worm(x) -> x is a worm
worm('Molie').

% cat(x) -> x is a cat
cat('Silvester').

% friends(F1, F2) -> F1 is a friend of F2
friends('Me', 'Silvester').
friends('Silvester', 'Me').

% likes(L1, L2) -> L1 likes L2
likes(L1, L2) :- friends(L1, L2) ; bird(L1), worm(L2) ; cat(L1), fish(L2) ; cat(L1), bird(L2).

% eats(A1, A2) -> animal A1 eats animal A2
eats(A1, A2) :- likes(A1, A2), \+ friends(A1, A2).

/*
    alínea a):
        - eats('Silvester', Food).
    alínea b):
        - O problema está na ambiguidade da palavra "gostar". Para que o predicado "eats" faça sentido,
        é necessário distinguir o "gostar de comer" do "gostar como amigo".
*/