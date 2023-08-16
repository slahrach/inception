build:
	docker-compose build --no-cache

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose down --rmi all

rebuild:
	docker-compose down
	docker-compose build
	docker-compose up -d
