*** Settings ***
Resource   ./resources/keywords.robot

*** Test Cases ***
Caso de Teste - Validação dos campos obrigatórios
    Abrir navegador        ${URL}        ${BROWSER}      ${HEADLESS}  
    Pouluar campos obrigatórios exeto 'First Name'
    Pouluar campos obrigatórios exeto 'Last name'
    Pouluar campos obrigatórios exeto 'Email'