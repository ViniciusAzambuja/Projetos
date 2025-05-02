*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}       chrome
${USERNAME}      Admin
${PASSWORD}      admin123
${LOGINBOTAO}    css=.orangehrm-login-button

#Esse teste é somente afins de Estudo

*** Keywords ***
Given o usuário acessa o site
    Log    Abrindo o navegador e acessando a URL ${URL}
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s

When ele preenche o usuário e a senha
    Log    Preenchendo campos de login: Usuário: ${USERNAME} | Senha: ${PASSWORD}
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}

And ele clica no botão de login
    Log    Clicando no botão de login
    Click Element    ${LOGINBOTAO}
    Sleep    5s

Then ele deve ver o dashboard
    Log    Verificando se o dashboard está visível
    Element Should Be Visible       
    ...  //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6

Given ele está no dash e clica na opção My info
    Log    Acessando a aba "My Info"
    Click Element    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[6]/a/span
    Sleep    5s

when ele preenche os campos do cadastro
    Log    Limpando campo de nome e preenchendo com "Gremista"
    Click Element          name=firstName
    Press Keys             name=firstName    CTRL+A
    Repeat Keyword    4 times    
    ...    Press Keys    name=firstName    BACKSPACE
    Sleep    1s
    Input Text             name=firstName    Gremista

*** Test Cases ***
Cenário 1: Login bem sucedido no sistema
    [Tags]    login    positivo
    Given o usuário acessa o site
    When ele preenche o usuário e a senha
    And ele clica no botão de login
    Then ele deve ver o dashboard

Cenário 2: Edição de dados pessoais após login
    [Tags]    cadastro    positivo
    Given o usuário acessa o site
    When ele preenche o usuário e a senha
    And ele clica no botão de login
    Then ele deve ver o dashboard
    Given ele está no dash e clica na opção My info
    When ele preenche os campos do cadastro