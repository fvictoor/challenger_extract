# Requerimentos
Antes de executar os testes automatizados, é necessário instalar os seguintes programas:

- [Pyhton 3.12](https://www.python.org/downloads/)
- [Nodejs Latest LTS Version: 20.10.0](https://nodejs.org/en/download/)


Após a instalação dos programas, é preciso instalar as seguintes bibliotecas usando o comando abaixo:



```bash
pip install robotframework
pip install robotframework-browser
pip install robotframework-faker
```

### Documentação das tecnologias usada

- [Robot Framework](https://robotframework.org/?tab=1#getting-started)
- [BrowserLibrary](https://marketsquare.github.io/robotframework-browser/Browser.html#library-documentation-top)
- [FakerLibrary](https://guykisel.github.io/robotframework-faker/)

Após a instalação das bibliotecas, é necessário iniciar a Biblioteca Browser com o Node.js usando o seguinte comando:
```bash
rfbrowser init
```

### Preparação do Ambiente Concluída

Para executar o teste automatizado com interface, utilize o seguinte comando:
```
robot -d ./logs ./teste.robot
```
