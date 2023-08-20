#!/bin/bash

if [ ! -d /var/run/mysqld ]; then
 mkdir /var/run/mysqld
fi
if [ ! -d /run/mysqld ]; then
 mkdir /run/mysqld
fi

if [ ! -d /var/lib/mysql/mysql ]; then
 mysql_install_db --user=root
fi

if [ ! -d /var/log/mysql/ ]; then
 mkdir /var/log/mysql/ && chown -R root:root /var/log/mysql && touch /var/log/mysql/error.log
fi

echo "CREATE DATABASE $DB_NAME;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql


service mariadb start
# Loop for checking if the mariadb server is up or not
while ! mysqladmin ping -hlocalhost --silent 2>/dev/null; do
 sleep 1
done
mysql -u root < init.sql
service mariadb stop
while  mysqladmin ping -hlocalhost --silent 2>/dev/null; do
 sleep 1
done
# run the service in the foreground
exec mysqld -u root
