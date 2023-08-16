#!/bin/bash

if [ ! -d /var/run/mysqld ]; then
 mkdir /var/run/mysqld
fi
if [ ! -d /run/mysqld ]; then
 mkdir /run/mysqld
fi
if [ ! -d /var/log/mysql/ ]; then
 mkdir /var/log/mysql/ && touch /var/log/mysql/error.log && chown -R mysql:mysql /var/log/mysql
fi

service mariadb start
sleep 5
mysql < /mariadb-conf.d/init.sql

exec mysqld