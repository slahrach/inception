build:
	mkdir -p /Users/macbook/data/wordpress-files
	mkdir -p /Users/macbook/data/wordpress-db
	docker-compose -f ./srcs/docker-compose.yml build

up:
	docker-compose -f ./srcs/docker-compose.yml up

down:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all

rebuild: down clean build up

clean:
	docker system prune -f
	docker volume prune -f
	rm -rf /Users/macbook/data/wordpress-files
	rm -rf /Users/macbook/data/wordpress-db

