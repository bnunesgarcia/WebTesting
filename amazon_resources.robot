*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                chrome
${URL}                    https://www.amazon.com.br/
${MENU_ELETRONICOS}       //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}     //a[contains(@class,'nav-a nav-b')]
${CONSOLE}                //span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
${ADD_CARRINHO}           add-to-cart-button
${CARRINHO}               //a[@href='/gp/cart/view.html?ref_=sw_gtc']
${EXLUIR}                 //input[@value='Excluir']


*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To   url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Wait Until Page Contains    text=${NOME_CATEGORIA}
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
  Wait Until Page Contains    text=${PRODUTO}
    
# GHERKIN BDD - STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa    

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "Xbox Series S"

# DESAFIO 1 - Automatizar mais testes no site da Amazon
Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element                    locator=${CONSOLE}
    Wait Until Element Is Visible    locator=${ADD_CARRINHO}
    Click Button                     locator=${ADD_CARRINHO}
  
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains    text=Adicionado ao carrinho

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    locator=${CARRINHO}
    Click Element                    locator=${CARRINHO}
    Wait Until Page Contains         text=Carrinho de compras
    Click Element                    locator=${EXLUIR}

Verificar se o carrinho fica vazio
    Wait Until Page Contains         text=Seu carrinho de compras da Amazon está vazio.

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio