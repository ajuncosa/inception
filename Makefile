COMPOSE_FILE := ./srcs/docker-compose.yml
WP_FILES = /home/ajuncosa/data/wp-files
DB_FILES = /home/ajuncosa/data/db-files
VOLUMES := $(shell docker volume ls -q)

DOCKER_COMPOSE := docker-compose

up:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

stop:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) stop

start:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) start

rebuild:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

clean:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

superclean: clean
	docker system prune -a --volumes -f
	docker volume rm $(VOLUMES) -f
	rm -rf $(WP_FILES)/* $(DB_FILES)/*
re: clean rebuild up

.PHONY: up stop start rebuild clean re superclean
