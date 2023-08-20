build:
	# mkdir -p /nfs/homes/$(USER)/data/wordpress-files
	# mkdir -p /nfs/homes/$(USER)/data/wordpress-db
	docker-compose build --no-cache

up:
	docker-compose up --force-recreate

down:
	docker-compose down -v wordpress mariadb --rmi all

rebuild: down clean build up

clean:
	docker-compose rm -f
	docker system prune -f
	# rm -rf /nfs/homes/$(USER)/data/wordpress-files
	# rm -rf /nfs/homes/$(USER)/data/wordpress-db

