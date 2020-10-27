ligado(a,b).
ligado(f,i).
ligado(a,c).
ligado(f,j).
ligado(b,d).
ligado(f,k).
ligado(b,e).
ligado(g,l).
ligado(b,f).
ligado(g,m).
ligado(c,g).
ligado(k,n).
ligado(d,h).
ligado(l,o).
ligado(d,i).
ligado(i,f).

% Utilitários de manipulação de Listas
membro(X, [X|_]).
membro(X, [_|Y]):- membro(X,Y).  

concatena([], L, L).
concatena([X|Y], L, [X|Lista]):- concatena(Y, L, Lista).

inverte([X], [X]).
inverte([X|Y], Lista):- inverte(Y, Lista1), concatena(Lista1, [X], Lista).

% resolva_prof(No_inicial, No_meta, Solucao) -> Determina um caminho entre dois nós de um Grafo, utilizando pesquisa em profundidade(evitando ciclos)
resolva_prof(No_inicial, No_meta, Solucao) :-
    profundidade([], No_inicial, No_meta, SolucaoInv),
    inverte(SolucaoInv, Solucao).

profundidade(Caminho, No_meta, No_meta, [No_meta|Caminho]).
profundidade(Caminho, No, No_meta, Sol) :-
    ligado(No, No1),
    \+ membro(No1, Caminho),   % previne ciclos
    profundidade([No|Caminho], No1, No_meta, Sol).

% resolva_larg(No_inicial, No_meta, Solucao) -> Determina um caminho entre dois nós de um Grafo, utilizando pesquisa em largura
resolva_larg(No_inicial, No_meta, Solucao) :-
    largura([[No_inicial]], No_meta, SolucaoInv),
    inverte(SolucaoInv, Solucao).

% Acha todos os X onde Y esta satisfeito e retorna numa lista Z
ache_todos(X, Y, Z) :- bagof(X, Y, Z), !.
ache_todos(_, _, []).

% Estende a fila até um filho N1 de N, verificando se N1 não pertence à fila, prevenindo, assim, ciclos
estende_ate_filho([N|Trajectoria], [N1, N|Trajectoria]) :-
    ligado(N, N1),
    \+ membro(N1, Trajectoria).

largura([[No_meta|T]|_], No_meta, [No_meta|T]).
largura([T|Fila], No_meta, Solucao) :-
    ache_todos(ExtensaoAteFilho, estende_ate_filho(T, ExtensaoAteFilho), Extensoes),
    concatena(Fila, Extensoes, FilaExtendida),
    largura(FilaExtendida, No_meta, Solucao).