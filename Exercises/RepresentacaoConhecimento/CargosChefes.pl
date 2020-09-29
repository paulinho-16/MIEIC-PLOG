% cargo(Cargo, Nome) -> a pessoa de nome Nome tem o cargo Cargo
cargo(tecnico, rogerio).
cargo(tecnico, ivone).
cargo(engenheiro, daniel).
cargo(engenheiro, isabel).
cargo(engenheiro, oscar).
cargo(engenheiro, tomas).
cargo(engenheiro, ana).
cargo(supervisor, luis).
cargo(supervisor_chefe, sonia).
cargo(secretaria_exec, laura).
cargo(diretor, santiago).

% chefiado_por(Cargo1, Cargo2) -> as pessoas com o Cargo1 são chefiadas pelas pessoas com o Cargo2
chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, director).
chefiado_por(secretaria_exec, director).

/*
    alínea a):
        - Quais são os cargos que chefiam técnicos e que são chefiados por algum outro cargo?
        - R: X = engenheiro ; Y = supervisor
    alínea b):
        - Quais são os cargos que chefiam técnicos e são desempenhados pela Ivone?
        - R: no
    alínea c):
        - Quais são as pessoas que desempenham o cargo de Supervisor?
        - R: X = luis
    alínea d):
        - Quais são as pessoas que desempenham um cargo que é chefiado por um Supervisor-Chefe ou por um Supervisor?
        - R: J = engenheiro ; P = daniel
    alínea e):
        - Quais são os cargos que são chefiados por um Diretor, mas que não são desempenhados pela Carolina?
        - R: P = supervisor_chefe
*/