#1 - Crie um arquivo de teste novo;
#2 - Crie uma variável do tipo LISTA na seção de variáveis globais que contenha todos os meses do ano;
#3 - Crie um teste que imprima no Console (Log To Console) cada item dessa lista (não use FOR, imprima um a um).
#4 - Rode os testes e confira se logou tudo certinho!
#  -----------------------------------------------------------------------------------------------------------------

*** Variables ***

# Tipo Lista
@{MESES_ANO}    janeiro  
...             fevereiro  
...             marco  
...             abril  
...             maio  
...             junho  
...             julho  
...             agosto  
...             setembro  
...             outubro  
...             novembro  
...             dezembro

*** Test Cases ***
Imprimir os meses do ano
    Log To Console       Mês 01 : ${MESES_ANO[0]}
    Log To Console       Mês 02 : ${MESES_ANO[1]}
    Log To Console       Mês 03 : ${MESES_ANO[2]}
    Log To Console       Mês 04 : ${MESES_ANO[3]}
    Log To Console       Mês 05 : ${MESES_ANO[4]}
    Log To Console       Mês 06 : ${MESES_ANO[5]}
    Log To Console       Mês 07 : ${MESES_ANO[6]}
    Log To Console       Mês 08 : ${MESES_ANO[7]}
    Log To Console       Mês 09 : ${MESES_ANO[8]}
    Log To Console       Mês 10 : ${MESES_ANO[9]}
    Log To Console       Mês 11 : ${MESES_ANO[10]}
    Log To Console       Mês 12 : ${MESES_ANO[11]}   