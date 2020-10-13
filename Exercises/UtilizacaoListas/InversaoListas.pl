% rev(L1, LM, L2) -> constitui o processo de inversão da lista L1, construindo LM e no final armazena esse valor em L2
rev([], L2, L2).
rev([X|L1], LM, L2) :- rev(L1, [X|LM], L2).

% inverter(L1, L2) -> calcula a lista invertida de L1, armazenada em L2
inverter(L1, L2) :- rev(L1, [], L2).