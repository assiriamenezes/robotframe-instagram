*** Settings ***
Resource         ../resources/ResourceBDD.robot
Resource         ../resources/BDDpt-br.robot
Suite Teardown   Fechar Navegador

*** Test Cases ***
Cenário 01: Login no Instagram
    Dado que esteja na tela HOME do Instagram
    E desejo inputar "usuario" na aba
    E inputo "senha" na aba
    Quando eu clicar no botao "entrar" para finalizar
    Então o popup e desmonstrado

Cenário 02: Seguir uma Pessoa no Instagram
    Dado que eu vou realizar uma BUSCA no Instagram
    Quando clicar no perfil que eu quero
    Então vou poder seguir o perfil clicando no BOTÃO

Cenário 03: Abrir imagem, curtir e comentar
    Dado que eu clico em uma IMAGEM do perfil
    Quando espero carregar
    Então dou uma curtida



