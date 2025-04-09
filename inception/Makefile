
run :
	@docker-compose -f ./srcs/docker-compose.yaml up --build -d
build :
	@docker-compose -f ./srcs/docker-compose.yaml build

up : 
	@docker-compose -f ./srcs/docker-compose.yaml up --build 

down:
	@docker-compose -f ./srcs/docker-compose.yaml  down --rm all

ps:
	@docker-compose -f ./srcs/docker-compose.yaml  ps
show:
	@docker-compose -f ./srcs/docker-compose.yaml  ps -a
images:
	@docker-compose -f ./srcs/docker-compose.yaml  images
stop:
	@docker-compose -f ./srcs/docker-compose.yaml  stop
start:
	@docker-compose -f ./srcs/docker-compose.yaml  start	