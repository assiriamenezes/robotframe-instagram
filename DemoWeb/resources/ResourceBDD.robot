*** Settings ***
Library     SeleniumLibrary



*** Variables ***
${BROWSER}              chrome
${URL}                  https://www.instagram.com/
${USUARIO}              xpath=.//*[@id="loginForm"]/div/div[1]/div/label/input
${SENHA}                xpath=.//*[@id="loginForm"]/div/div[2]/div/label/input
${BOTAO_ENTRAR}         xpath=.//*[@id="loginForm"]/div/div[5]/button/span[2]
${PAGINA_INICIAL}       xpath=.//*[@id="react-root"]/section/main/section/div/h4
${POP-UP}               xpath=/html/body/div[4]/div/div/
${ABABUSCA}             xpath=/html/body/div[1]/section/nav/div[2]/div/div/div[2]/input
${COM}                  xpath=/html/body/div[4]/div[2]/div/article/div[3]/section[3]/div/form/textarea
${LIKE}                 xpath=/html/body/div[4]/div[2]/div/article/div[3]/section[1]/span[1]/button/div/span
${PARTICULAR}           xpath=//*[@id="react-root"]/section/main/div/div[3]/article/div[1]/div/div[1]/div[1]/a/div[2]

*** Keywords ***
#### DADO
Que esteja na tela HOME do Instagram
    Open Browser    https://www.instagram.com/      ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible  ${USUARIO}

Que eu vou realizar uma BUSCA no Instagram
    Wait Until Element Is Visible  ${ABABUSCA}
    Input Text          ${ABABUSCA}      instagram 
    Sleep  2s

Que eu clico em uma IMAGEM do perfil
    Execute JavaScript     window.scrollBy(900, 900)
    Sleep  2s
    Wait Until Page Contains Element     xpath=/html/body/div[1]/section/main/div/div[4]/article/div[1]/div/div[2]/div[1]
    Click Element       xpath=/html/body/div[1]/section/main/div/div[4]/article/div[1]/div/div[2]/div[1]
    Sleep  5s

#### E
Desejo inputar "${IN_USER}" na aba
    Input Text  ${USUARIO}      assiriatest@gmail.com
    Sleep  2s

Inputo "${IN_PASS}" na aba
    Input Text  ${SENHA}        sidia@123
    Sleep  3s

    
#### QUANDO
Eu clicar no botao "entrar" para finalizar
    Wait Until Page Contains Element       xpath=//*[@id="loginForm"]/div/div[3]/button/div
    Click Element    xpath=//*[@id="loginForm"]/div/div[3]/button/div
    Sleep   10s

Espero carregar
    Wait Until Page Contains Element    xpath=/html/body/div[4]/div[2]/div

Clicar no perfil que eu quero
    Wait Until Page Contains Element    xpath=//*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/div[3]/div/div[2]/div/div[1]/a/div/div[2]
    Click Element               xpath=//*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/div[3]/div/div[2]/div/div[1]/a/div/div[2]
    Sleep  5s
#### ENTÃO
O popup e desmonstrado
    Click Element   xpath=/html/body/div[4]/div/div/div/div[3]/button[1]
    Sleep  1s

Vou poder seguir o perfil clicando no BOTÃO
    Wait Until Page Contains Element        xpath=/html/body/div[1]/section/main/div/header/section/div[1]/div[2]/div/div/div/span/span[1]
    Click Element       xpath=/html/body/div[1]/section/main/div/header/section/div[1]/div[2]/div/div/div/span/span[1]
    Sleep  3s

Dou uma curtida
    Wait Until Page Contains Element     xpath=/html/body/div[4]/div[2]/div
    Click Element           xpath=/html/body/div[4]/div[2]/div/article/div[3]/section[1]/span[1]/button/div/span
    Sleep  1s
#### TEARDOWN
Fechar Navegador
    Close Browser
