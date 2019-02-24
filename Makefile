.PHONY: all help code up in kill

all: help 
help:
	@echo "\nUsage: \n\n\
	make up                  Run container in the background \n\
	make kill                Kill the running container \n\
	make code                Bring container up and enter it \n\
	make explore             Enter the running container \n"

code: up explore
up: 
	@docker-compose up -d --build 
explore:
	@docker-compose exec workspace zsh 
kill:
	@docker-compose kill
