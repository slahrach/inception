build:
	mkdir -p /Users/$(USER)/data/wordpress-files
	mkdir -p /Users/$(USER)/data/wordpress-db
	docker-compose build --no-cache

up:
	docker-compose up -d --remove-orphans --force-recreate 

down:
	docker-compose down -v wordpress mariadb --rmi all

rebuild: clean down build up

clean:
	docker-compose rm -f
	rm -rf /Users/$(USER)/data/wordpress-files
	rm -rf /Users/$(USER)/data/wordpress-db

