% male(x) -> x is male
male('Aldo Burrows').
male('Lincoln Burrows').
male('Michael Scofield').
male('LJ Burrows').

% female(x) -> x is female
female('Christina Rose Scofield').
female('Lisa Rix').
female('Sara Tancredi').
female('Ella Scofield').

% parent(x, y) -> x is a parent of y
parent('Aldo Burrows', 'Lincoln Burrows').
parent('Christina Rose Scofield', 'Lincoln Burrows').
parent('Aldo Burrows', 'Michael Scofield').
parent('Christina Rose Scofield', 'Michael Scofield').
parent('Lisa Rix', 'LJ Burrows').
parent('Lincoln Burrows', 'LJ Burrows').
parent('Michael Scofield', 'Ella Scofield').
parent('Sara Tancredi', 'Ella Scofield').

% parents(Child, Father, Mother) -> returns the parents of Child (Father and Mother) (alínea a)
parents(Child, Father, Mother) :- male(Father), female(Mother), parent(Father, Child), parent(Mother, Child).

/*
    alínea a): 
        - parents('Michael Scofield', Father, Mother).
        - parent(Parent, 'Michael Scofield'). --- Apresenta cada parent, é necessário inserir ';' para apresentar todas as possibilidades
    alínea b):
        - parent('Aldo Burrows', Child). --- Apresenta cada child, é necessário inserir ';' para apresentar todas as possibilidades
*/