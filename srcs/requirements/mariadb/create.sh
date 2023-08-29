#!/bin/bash

service mariadb start

sleep 3

mariadb -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mariadb -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* to '$DB_USER'@'%';"

mariadb -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mariadbd -u root
