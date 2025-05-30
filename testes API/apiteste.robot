*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections
Resource      apiteste.resource


*** Test Cases ***
API 1: Obter lista de todos os produtos
   Obter lista de todos os produtos

API 2: POST para a lista de todos os produtos
    Post para lista de todos os produtos

API 3: Obter lista de todas as marcas
    Obter lista de todos as marcas

API 4: COLOCAR na lista de todas as marcas
   colocar lista de todos as marcas

API 5: POST para pesquisar produto
    Post pesquisa produto

API 6: POST para pesquisar produto sem parâmetro search_product
    Post pesquisa produto sem parametro

API 7: POST para verificar login com detalhes válidos
    Post para verificar login com detalhes validos

API 8: POST para verificar login sem parâmetro de e-mail
    Post para verificar login sem parametros

API 9: DELETE para verificar o login
    Delete verificar login

API 10: POST para verificar login com detalhes inválidos
    Post para verificar login detalhes invalidos

API 11: POST para criar/registrar conta de usuário
     POST para criar/registrar conta de usuário

API 12: MÉTODO DELETE para excluir conta de usuário
    MÉTODO DELETE para excluir conta de usuário

API 13: MÉTODO PUT para atualizar a conta do usuário
    MÉTODO PUT para atualizar a conta do usuário

API 14: OBTER detalhes da conta do usuário por e-mail
    OBTER detalhes da conta do usuário por e-mail
    
    
    