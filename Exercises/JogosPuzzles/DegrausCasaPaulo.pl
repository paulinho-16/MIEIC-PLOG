% casa_degraus(Degraus, N, L) -> dado o número de degraus Degraus da escada, devolve em N o número de maneiras diferentes de subir a escada e em L a lista das possibilidades, sendo que o Paulo sobe um ou dois degraus em cada passada
casa_degraus(Degraus, N, L) :-
    findall(Possibilidade, (degraus_possiveis(Degraus, Possibilidade)), L),
    length(L, N).

salto_degraus(1).
salto_degraus(2).

degraus_possiveis(0, []).
degraus_possiveis(Degraus, [Salto|Possibilidade]) :-
    Degraus > 0,
    salto_degraus(Salto),
    NovoDegraus is Degraus - Salto,
    degraus_possiveis(NovoDegraus, Possibilidade).