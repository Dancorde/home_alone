# Home Alone
![rails](https://img.shields.io/badge/rails-v5.1.6-green.svg)
![ruby](https://img.shields.io/badge/ruby-2.4.1p111-green.svg)
![docker](https://img.shields.io/badge/docker-17.05.0-green.svg)

O projeto tem como finalidade encontrar locais de interesse próximos à um endereço fornecido pelo usuário, como por exmplo bares, hospitais, bancos, etc.

Ele foi utilizado como trabalho final para a disciplina de SSC0130 - Engenharia de Software, do primeiro semestre de 2018, em parceria com as empresas Arquivei e Roca Imóveis.

## Pré-requisitos

Antes de tudo é necessário ter o Docker instalado:

* [Windows](https://docs.docker.com/docker-for-windows/)
* [OS X](https://docs.docker.com/docker-for-mac/)
* [Linux](https://docs.docker.com/get-started/)

## Inicialização

### Comandos do rails
Para executar qualquer comnado do Rails é necessário digitar `docker-compose run web` antes do comando, por exemplo

```console
$ docker-compose run web rails db:create
```

### Servidor
Para iniciar o servidor basta digitar no console

```console
$ docker-compose up
```

Para encerrar o servidor aperte `Ctrl+C` e digite no console

```console
$ docker-compose down
```

### Banco de dados
É necessário criar o banco de dados antes da inicialização do projeto pela primeira vez com os seguintes comando:

```console
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
```

Para inserir alguns locais no bando de dados basta executar o seguinte comando

```console
$ docker-compose run web rails db:seed
```

Após isto o projeto já esta pronto para ser utilizado.

## Autores

* **[Danilo Henrique Cordeiro](https://github.com/Dancorde)**
* **[Danilo Téo](https://github.com/DaniloTeo)**
* **[Gabriel Doimo Filippi](https://github.com/gabrieldoimo)**
* **[Rodrigo Valim Maciel](https://github.com/rvalimaciel)**
* **[Tobias Mesquita Silva da Veiga](https://github.com/tobiasveiga)**
