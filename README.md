## Como funciona
O LUCAS funciona com um sistema em Lua que pega os itens de um baú determinado, leva eles para as estações de crafting determinadas em sequência e volta com o resultado no mesmo baú.
## Setup
O LUCAS deve ser utilizado em um Computer ou Advanced Computer, ligado as estações de Crafting com Networking Cables e Modems, e o código deve ser colocado no Computer da seguinte maneira:
### pelo PasteBin (https://pastebin.com/NWzwFnzw)
- Copie o código no final do URL do pastebin
- Digite "pastebin get NWzwFnz lucas" para fazer o download do código
- Digite "pastebin run NWzwFnz" para rodar o código uma unica vez
### pelo GitHub (https://github.com/EtCiano/L.U.C.A.S-ComputerCraft/tree/main)
- Vá no código, clique em "raw" e copie o link do arquivo "raw"
- Digite "wget run https://raw.githubusercontent.com/EtCiano/L.U.C.A.S-ComputerCraft/refs/heads/main/L.U.C.A.S.lua" para rodar o código
### Sobre o Setup dentro do minecraft
O Sistema precisa de alguns blocos conectados de maneira sistemática:
- O computador
- O baú/Barril de Input e Output
- As estações de Crafting determinadas
- Os Modems conectando as estações de crafting, o baú I/O e o Computador com cabos conectando todos eles
- Certifique-se que os modems estão ligados

  <img width="626" height="403" alt="2026-03-28_16 24 36" src="https://github.com/user-attachments/assets/c8c68697-e9fe-49d8-87b4-ba6c9f04a715" />

- Após colocar os blocos, coloque no código as estações que você colocou para que sejam aceitas no código (craftingsPossiveis, linha 16)

## Como Usar
Para utilizar, coloque os itens no baú e execute o código (caso tenha feito o download, é só digital "lucas.lua" no computador) e coloque o número das estações que deseja que os itens sejam levados em sequencia com espaço entre eles
Ex.: Caso queira que um item vá para a Mechanical Press e o Mechanical Mixer, no exemplo padrão, digite "2 1" no terminal do computador

## Problemas e futuras atualizações
- As estações do mekanism e outros ainda não foram testadas, futuramente seram incluídas no código;
- É necessário colocar as estações no código separadamente para anexa-las, futuramente será feito um sistema para escanear as estações automáticamente;
- Futuramente será usado o monitor, enquanto isso é possivel tirar a linha 10 a 12;
