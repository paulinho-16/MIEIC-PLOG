% aluno(Nome, Cadeira) -> o aluno de nome Nome está inscrito à cadeira Cadeira
aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).

% frequenta(Nome, Faculdade) -> o aluno de nome Nome frequenta a faculdade Faculdade
frequenta(joao, feup).
frequenta(maria, feup).
frequenta(joel, ist).

% professor(Nome, Cadeira) -> o professor de nome Nome leciona a cadeira Cadeira
professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).

% funcionario(Nome, Faculdade) -> o funcionário de nome Nome trabalha na faculdade Faculdade
funcionario(pedro, ist).
funcionario(ana_paula, feup).
funcionario(carlos, feup).

% ensina(Professor, Aluno) -> o professor Professor ensina o aluno Aluno
ensina(Professor, Aluno) :- aluno(Aluno, Cadeira), professor(Professor, Cadeira), frequenta(Aluno, Faculdade), funcionario(Professor, Faculdade).

% universidade(Pessoa, Universidade) -> a pessoa Pessoa faz parte da universidade Universidade (aluno ou docente)
universidade(Pessoa, Universidade) :- frequenta(Pessoa, Universidade) ; funcionario(Pessoa, Universidade).

% colega(P1, P2) -> a pessoa P1 é colega da pessoa P2
colega(P1, P2) :- (aluno(P1, Cadeira), aluno(P2, Cadeira) ; frequenta(P1, Faculdade), frequenta(P2, Faculdade)), P1 \= P2.
colega(P1, P2) :- funcionario(P1, Faculdade), funcionario(P2, Faculdade), P1 \= P2.

/*
    alínea a):
        - ensina(X, Aluno).
    alínea b):
        - universidade(Pessoa, X).
    alínea c):
        - colega(P1, P2).
*/