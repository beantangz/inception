NAME = inception

COMPOSE = docker-compose -f srcs/docker-compose.yml

DATA_DIR = /home/mleineku/data
WP_DIR = $(DATA_DIR)/wordpress_data
DB_DIR = $(DATA_DIR)/mariadb_data

all: up

up:
	@mkdir -p $(WP_DIR) $(DB_DIR)
	@$(COMPOSE) up -d

build:
	@$(COMPOSE) build

rebuild:
	@$(COMPOSE) build --no-cache

down:
	@$(COMPOSE) down

restart: down up

clean:
	@$(COMPOSE) down --volumes --remove-orphans

fclean: clean
	@docker system prune -af
	@sudo rm -rf $(DATA_DIR)

re: fclean all


