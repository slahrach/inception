#!/bin/sh
#creates new user with editor role


if [ ! -d "/var/www/html/" ]; then
    mkdir -p /var/www/html/ && chown -775 www-data:www-data /var/www/html/
fi

cd /var/www/html/

wp core download --path=/var/www/html/ --allow-root


wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost="mariadb" --allow-root

wp core install --url=https://localhost --title="My WordPress Site" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root

wp user create ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASSWORD} --role=editor --allow-root

exec php-fpm7.4 -F -R