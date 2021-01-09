# Num Chess Problem

### Puzzle
Cada casa numerada no tabuleiro de xadrez mostra quantas vezes aquela casa é atacada. 
Existem seis peças de xadrez que podem ser colocadas, uma de cada tipo, sendo elas o rei, rainha, torre, bispo, cavalo e peão. 
Ao contrário do xadrez, os peões podem ser colocados na primeira ou na última fila. Não há duas peças na mesma casa e nenhuma peça está numa casa numerada.

O *Paper* que escrevemos para explicar a resolução deste problema encontra-se [aqui](./paper.pdf).

> [Chess-Num Puzzles](https://erich-friedman.github.io/puzzle/chessnum/)

## Instalação e Execução
### Windows
- Abrir o SICStus Prolog
- 
- No menu Settings, escolher Font e selecionar tipo de letra Consolas.
- No menu File, escolher Consult e selecionar o ficheiro [main.pl](./source/main.pl)
- Executar o comando "solve(Positions)." e selecionar o tipo de problema a resolver.
- Os inputs não necessitam de terminar com um ponto final, uma vez que implementamos um predicado para facilitar a leitura de inputs.

### Linux
- Executar o ficheiro sicstus (./sicstus), na pasta bin da instalação.
- Usar o predicado consult(Path), em que Path é o caminho completo para o ficheiro [main.pl](./source/main.pl).
- Executar o comando "solve(Positions)." e selecionar o tipo de problema a resolver.
- Os inputs não necessitam de terminar com um ponto final, uma vez que implementamos um predicado para facilitar a leitura de inputs.

### Group Members
- Diogo Samuel Fernandes, up201806250@fe.up.pt
- Paulo Jorge Ribeiro, up201806505@fe.up.pt

