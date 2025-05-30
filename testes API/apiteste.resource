*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections


*** Variables ***
${BASE_URL}    https://automationexercise.com
${body_novo}



*** Keywords ***
Obter lista de todos os produtos
    Create Session    alias=sessao_produtos    url=${BASE_URL}
    ${resposta}   GET On Session    alias=sessao_produtos    url=/api/productsList    expected_status=200
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.text}
    Log   ${resposta.content}
    

Post para lista de todos os produtos
    Create Session   alias=sessao_produtos    url=${BASE_URL}
    ${resposta}   POST On Session    alias=sessao_produtos    url=/api/productsList       expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}


Obter lista de todos as marcas
    Create Session   alias=sessao_marcas   url=${BASE_URL}
    ${resposta}   GET On Session   alias=sessao_marcas    url=/api/brandsList   expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}



colocar lista de todos as marcas
    Create Session   alias=sessao_marcas   url=${BASE_URL}
    ${resposta}   PUT On Session   alias=sessao_marcas    url=/api/brandsList   expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}



Post pesquisa produto
     ${body}  Create Dictionary
     ...  search_product=Top 
     Log   ${body}   
          
       
    Create Session   alias=sessao_pesquisa_produto   url=${BASE_URL}
    ${resposta}   POST On Session   alias=sessao_pesquisa_produto   url=/api/searchProduct    data=${body}    expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    


Post pesquisa produto sem parametro
     ${body}  Create Dictionary
     Log   ${body}   
          
       
    Create Session   alias=sessao_pesquisa_produto   url=${BASE_URL}
    ${resposta}   POST On Session   alias=sessao_pesquisa_produto   url=/api/searchProduct    data=${body}    expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    

 Post para verificar login com detalhes validos
    ${body}  Create Dictionary
    ...    email=vinicius@vinicius.com
    ...    password=123456
    Log   ${body}   
          
       
    Create Session   alias=sessao_pesquisa_login   url=${BASE_URL}
    ${resposta}  POST On Session     alias=sessao_pesquisa_login  url=/api/verifyLogin   data=${body}  expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    Log   ${resposta.links}
    Log   ${resposta.cookies}
    

Post para verificar login sem parametros
    ${body}  Create Dictionary
    Log   ${body}   
          
       
    Create Session   alias=sessao_pesquisa_login   url=${BASE_URL}
    ${resposta}  POST On Session     alias=sessao_pesquisa_login  url=/api/verifyLogin    expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    Log   ${resposta.links}
    Log   ${resposta.cookies}


Delete verificar login
    Create Session   alias=sessao_delete_login   url=${BASE_URL}
    ${resposta}  DELETE On Session    alias=sessao_delete_login  url=/api/verifyLogin    expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    Log   ${resposta.links}
    Log   ${resposta.cookies}


Post para verificar login detalhes invalidos
    ${body}  Create Dictionary
    ...    email=viniciuss@vinicius.com
    ...    password=1234567
    Log   ${body}   
          
       
    Create Session   alias=sessao_pesquisa_login   url=${BASE_URL}
    ${resposta}  POST On Session     alias=sessao_pesquisa_login  url=/api/verifyLogin  data=${body}  expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    Log   ${resposta.links}
    Log   ${resposta.cookies}


POST para criar/registrar conta de usuário
    ${body}  Create Dictionary
    ...    name=Renata
    ...    email=renata@almeida.com
    ...    password=123456
    ...    title=Miss
    ...    birth_date=21
    ...    birth_month=09
    ...    birth_year=1997
    ...    firstname=Renata
    ...    lastname=Almeida
    ...    company=qualita
    ...    address1=narnia
    ...    address2=asgard
    ...    country=holanda
    ...    zipcode=958774789
    ...    state=rio de janeiro
    ...    city=piracanjuba
    ...    mobile_number=9987788555
    Log   ${body}   
          
       
    Create Session   alias=sessao_create_conta   url=${BASE_URL}
    ${resposta}  POST On Session     alias=sessao_create_conta  url=/api/createAccount     data=${body}      expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    Log   ${resposta.links}
    Log   ${resposta.cookies}


MÉTODO DELETE para excluir conta de usuário
    ${body}  Create Dictionary
    ...    email=renata@almeida.com
    ...    password=123456
    Log   ${body}    

       
    Create Session   alias=sessao_delete_conta  url=${BASE_URL}
    ${resposta}  DELETE On Session    alias=sessao_delete_conta  url=/api/deleteAccount  data=${body}   expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    Log   ${resposta.links}
    Log   ${resposta.cookies}


MÉTODO PUT para atualizar a conta do usuário
    ${body}  Create Dictionary
    ...    name=Renata
    ...    email=renata@almeida.com
    ...    password=123456
    ...    title=Miss
    ...    birth_date=21
    ...    birth_month=09
    ...    birth_year=1997
    ...    firstname=Renata
    ...    lastname=Almeida
    ...    company=qualita
    ...    address1=narnia
    ...    address2=asgard
    ...    country=holanda
    ...    zipcode=958774789
    ...    state=porto alegre
    ...    city=piracanjuba
    ...    mobile_number=9987788555
    Log   ${body}   
    Set Test Variable    ${body_novo}    ${body} 
          
       
    Create Session   alias=sessao_update_conta   url=${BASE_URL}
    ${resposta}  PUT On Session     alias=sessao_update_conta  url=/api/updateAccount    data=${body_novo}     expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
    Log   ${resposta.links}
    Log   ${resposta.cookies}
    

 OBTER detalhes da conta do usuário por e-mail  

    Create Session   alias=sessao_obter_conta   url=${BASE_URL}
    ${resposta}   GET On Session   alias=sessao_obter_conta   url=/api/getUserDetailByEmail?name=renata@almeida.com  expected_status=200
    Log   ${resposta.text}  
    Log   ${resposta.json()}
    Log   ${resposta.status_code}
    Log   ${resposta.reason}
    Log   ${resposta.headers}
    Log   ${resposta.elapsed}
    Log   ${resposta.content}
