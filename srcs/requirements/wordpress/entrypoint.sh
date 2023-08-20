#!/bin/sh
#creates new user with editor role

if [ ! -d "/var/www/html/" ]; then
    mkdir -p /var/www/html/ && chown -775 www-data:www-data /var/www/html/
fi

cd /var/www/html/

echo "Hello World"

# cat wp-config.php
#change the wp-config.php file to use the values passed in as environment variables
# sed -i "s/username_here/${DB_USER}/" wp-config.php
# sed -i "s/password_here/${DB_PASSWORD}/" wp-config.php
# sed -i "s/database_name_here/${DB_NAME}/" wp-config.php

#create the config file
wp core download --path=/var/www/html/ --allow-root

echo "hey"

wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost="mariadb" --allow-root

echo "wow"

# wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost="mariadb" --allow-root

echo "no"

wp core install --url=https://localhost --title="My WordPress Site" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root

echo "ouiii"
# wp user create ${WP_USER} ${ADMIN_EMAIL} --user_pass=${WP_PASSWORD} --role=editor --allow-root

exec php-fpm7.3 -F -R