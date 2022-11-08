COMPOSE_FILE = ./srcs/docker-compose.yml
MARIADB_SERVICE = mariadb
WORDPRESS_SERVICE = wordpress
NGINX_SERVICE = nginx

DOCKER_COMPOSE = docker compose

up:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d $(MARIADB_SERVICE)
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up  $(WORDPRESS_SERVICE)

stop:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) stop

start:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) start

rebuild:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

clean:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

re: clean rebuild start

.PHONY: start stop rebuild clean re
