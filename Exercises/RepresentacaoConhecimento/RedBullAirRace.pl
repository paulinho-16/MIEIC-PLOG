% pilot(x) -> x is a pilot
pilot('Lamb').
pilot('Besenyei').
pilot('Chambliss').
pilot('MacLean').
pilot('Mangold').
pilot('Jones').
pilot('Bonhomme').

% belongs(x, y) -> pilot x belongs to team y
belongs('Lamb', 'Breitling').
belongs('Besenyei', 'Red Bull').
belongs('Chambliss', 'Red Bull').
belongs('MacLean', 'Mediterranean Racing Team').
belongs('Mangold', 'Cobra').
belongs('Jones', 'Matador').
belongs('Bonhomme', 'Matador').

% drives(x, y) -> pilot x drives the plane y
drives('Lamb', 'MX2').
drives('Besenyei', 'Edge540').
drives('Chambliss', 'Edge540').
drives('MacLean', 'Edge540').
drives('Mangold', 'Edge540').
drives('Jones', 'Edge540').
drives('Bonhomme', 'Edge540').

% circuit(x) -> x is a circuit
circuit('Istanbul').
circuit('Budapest').
circuit('Porto').

% won(x, y) -> pilot x won in the circuit y
won('Jones', 'Porto').
won('Mangold', 'Budapest').
won('Mangold', 'Istanbul').

% gates(x, y) -> circuit x has y gates
gates('Istanbul', 9).
gates('Budapest', 6).
gates('Porto', 5).

% winning_team(Team, Circuit) -> team Team was the winning team in the circuit Circuit
winning_team(Team, Circuit) :- circuit(Circuit), won(Pilot, Circuit), pilot(Pilot), belongs(Pilot, Team).

% won_many(Pilot) -> returns the pilots who won more than one circuit
won_many(Pilot) :- pilot(Pilot), won(Pilot, C1), won(Pilot, C2), circuit(C1), circuit(C2), C1 @< C2.

% more_than_8_gates(Circuit) -> returns the circuits which have more than 8 gates
more_than_8_gates(Circuit) :- circuit(Circuit), gates(Circuit, Gates), Gates > 8.

% not_edge540(Pilot) -> returns the pilots that don't drive the plane Edge540
not_edge540(Pilot) :- pilot(Pilot), \+ drives(Pilot, 'Edge540').

/*
    alínea a):
        - won(Pilot, 'Porto').
    alínea b):
        - winning_team(Team, 'Porto').
    alínea c):
        - won_many(Pilot).
    alínea d):
        - more_than_8_gates(Circuit).
    alínea e):
        - not_edge540(Pilot).
*/