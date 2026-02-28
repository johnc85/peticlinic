
# PetClinic - Spring Boot Demo

Este projeto é uma aplicação de exemplo baseada no Spring Boot, que simula uma clínica veterinária. Ele permite o cadastro, busca e gerenciamento de donos, pets, veterinários e visitas, servindo como referência para arquitetura, testes e integração de aplicações Java modernas.

## Funcionalidades
- Cadastro e busca de donos de pets
- Cadastro e gerenciamento de pets
- Cadastro de veterinários
- Registro de visitas
- Interface web responsiva
- Pronto para observabilidade com Datadog (traces e logs)

## Como executar localmente com Docker

1. **Clone o repositório:**
	```sh
	git clone <URL_DO_REPOSITORIO>
	cd peticlinic
	```

2. **Configure as variáveis de ambiente do Datadog (opcional, para observabilidade):**
	- Crie um arquivo `.env` na raiz com:
	  ```env
	  DD_API_KEY=<sua_datadog_api_key>
	  DD_SITE=datadoghq.com
	  ```

3. **Suba a aplicação e dependências:**
	```sh
	docker-compose up --build
	```

4. **Acesse a aplicação:**
	- Web: [http://localhost:8080](http://localhost:8080)

5. **Parar os containers:**
	```sh
	docker-compose down
	```

## Observabilidade
O projeto já está pronto para enviar logs e traces para o Datadog, caso as variáveis de ambiente estejam configuradas e o agente esteja ativo via docker-compose.


