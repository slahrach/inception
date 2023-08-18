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


mysqld -u root &
sleep 5
mysql --user=root < init.sql

# Keep the container running
tail -f /dev/null
