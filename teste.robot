*** Settings ***

Library    Browser
Library    FakerLibrary
Library    String 

*** Variables ***
${URL}            http://demo.automationtesting.in/Register.html
${BROWSER}        chromium
${HEADLESS}       False
${TIMEOUT}        30s
${DELAY_CLICK}    200ms
${DELAY_TEXT}     60ms

*** Keywords ***

Abrir navegador
    [Arguments]                      ${URL}        ${BROWSER}      ${HEADLESS}   
    New Browser                      ${BROWSER}    ${HEADLESS}    
    New Context                      recordVideo={'dir':"../videos"}    viewport={'width': 1600, 'height': 1024}
    Set Browser Timeout              ${TIMEOUT} 
    New Page                         ${URL}
    ${TITLE_PAGE}                    Get Title
    Log                              Titulo da pagina acessada: ${TITLE_PAGE}
    Take Screenshot                  EMBED    fullPage=True    timeout=${TIMEOUT} 

Pouluar campos obrigatórios exeto ${CAMPO_EXCECAO}
    
    # Criar os dados Fake para Teste
    ${FIRST_NAME}            FakerLibrary.First Name
    ${LAST_NAME}             FakerLibrary.Last Name
    ${EMAIL}                 FakerLibrary.Email
    ${PHONE}                 Generate Random String     length=10    chars=[NUMBERS]
    ${GENDER}  Set Variable  'Male'

    # Preencher os campos

    IF     ${CAMPO_EXCECAO} == 'First Name'
        # Realizar o preenchimento dos campos obrigatórios 
        Type Text             css=input[placeholder="Last Name"]         ${LAST_NAME}         delay=${DELAY_TEXT} 
        Type Text             css=input[type="email"]                    ${EMAIL}             delay=${DELAY_TEXT}
        Type Text             css=input[ng-model="Phone"]                ${PHONE}             delay=${DELAY_TEXT}  
        Click With Options    css=input[value="Male"]                    delay=${DELAY_CLICK}
        Click                 xpath=//button[@type='submit'][contains(.,'Submit')]   
        
        # Valida a mensagem de erro 'Preencha este campo.'
        ${MESSAGE}   Evaluate JavaScript    
        ...    css=input[placeholder="First Name"]        document.querySelector('input[placeholder="First Name"]').validationMessage
        Should Be Equal As Strings    ${MESSAGE}        Preencha este campo.
        Take Screenshot       EMBED    fullPage=True    timeout=${TIMEOUT}
        Log    ${MESSAGE}
        Click                 xpath=//button[@type='button'][contains(.,'Refresh')]

    ELSE IF     ${CAMPO_EXCECAO} == 'Last name'
        # Realizar o preenchimento dos campos obrigatórios
        Type Text             css=input[placeholder="First Name"]        ${FIRST_NAME}        delay=${DELAY_TEXT}  
        Type Text             css=input[type="email"]                    ${EMAIL}             delay=${DELAY_TEXT}
        Type Text             css=input[ng-model="Phone"]                ${PHONE}             delay=${DELAY_TEXT}  
        Click With Options    css=input[value="Male"]                    delay=${DELAY_CLICK}
        Click                 xpath=//button[@type='submit'][contains(.,'Submit')]   
        
        # Valida a mensagem de erro 'Preencha este campo.'
        ${MESSAGE}   Evaluate JavaScript    
        ...    css=input[placeholder="Last Name"]        document.querySelector('input[placeholder="Last Name"]').validationMessage
        Should Be Equal As Strings    ${MESSAGE}        Preencha este campo.
        Take Screenshot       EMBED    fullPage=True    timeout=${TIMEOUT}
        Log    ${MESSAGE}
        Click                 xpath=//button[@type='button'][contains(.,'Refresh')]
    ELSE IF     ${CAMPO_EXCECAO}== 'Email'
         # Realizar o preenchimento dos campos obrigatórios 
        Type Text             css=input[placeholder="First Name"]        ${FIRST_NAME}        delay=${DELAY_TEXT}
        Type Text             css=input[placeholder="Last Name"]         ${LAST_NAME}         delay=${DELAY_TEXT} 
        Type Text             css=input[ng-model="Phone"]                ${PHONE}             delay=${DELAY_TEXT}  
        Click With Options    css=input[value="Male"]                    delay=${DELAY_CLICK}
        Click                 xpath=//button[@type='submit'][contains(.,'Submit')]   
        
        # Valida a mensagem de erro 'Preencha este campo.'
        ${MESSAGE}   Evaluate JavaScript    
        ...    css=input[type="email"]        document.querySelector('input[type="email"]').validationMessage
        Should Be Equal As Strings    ${MESSAGE}        Preencha este campo.
        Take Screenshot       EMBED    fullPage=True    timeout=${TIMEOUT}
        Log    ${MESSAGE}
        Click                 xpath=//button[@type='button'][contains(.,'Refresh')]
    END
    
    # Documenta os dados utilizados
    @{PESSOA}                   Create List    
    ...                         Nome Aleatório: ${FIRST_NAME} ${LAST_NAME}   
    ...                         Telefone Aleatório: ${PHONE}  
    ...                         Email: ${EMAIL}
    ...                         Genero: ${GENDER}
        Log Many    @{PESSOA}
*** Test Cases ***

Caso de Teste - Validação dos campos obrigatórios
    Abrir navegador        ${URL}        ${BROWSER}      ${HEADLESS}  
    Pouluar campos obrigatórios exeto 'First Name'
    Pouluar campos obrigatórios exeto 'Last name'
    Pouluar campos obrigatórios exeto 'Email'