#!/bin/sh
#creates new user with editor role

# if [ ! -d "/var/www/html/" ]; then
#     mkdir -p /var/www/html/
# fi

cd /var/www/html/

cat wp-config.php
#change the wp-config.php file to use the values passed in as environment variables
sed -i "s/username_here/${DB_USER}/" wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/" wp-config.php
sed -i "s/database_name_here/${DB_NAME}/" wp-config.php

wp core download --allow-root
# wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost="mariadb" --allow-root

wp user create ${WP_USER} --user_pass=${WP_PASSWORD} --role=editor --allow-root

wp core install --url=http://localhost --title="My WordPress Site" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root


exec php-fpm7.3 -F -R