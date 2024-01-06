*** Settings ***
Resource   ./resources/keywords.robot

*** Test Cases ***
Caso de Teste - Validação dos campos obrigatórios
    Abrir navegador        ${URL}        ${BROWSER}      ${HEADLESS}  
    Popular os campos obrigatórios exeto 'First Name'
    Popular os campos obrigatórios exeto 'Last name'
    Popular os campos obrigatórios exeto 'Email'