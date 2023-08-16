#!/bin/sh
#downloads the WordPress core files, the option ( --allow-root ) will run the command as root
#creates new user with editor role
wp user create ${WP_USER} --user_pass=${WP_PASSWORD} --role=editor --allow-root
#generates the WordPress configuration file
wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost="mariadb" --allow-root

# wp user create ${WP_USER} --user_pass=${WP_PASSWORD} --role=editor --allow-root
#install a new WordPress site using the downloaded core files
#--url specifies the URL of your website, --title is the site title, --admin_user, --admin_password, and --admin_email set up the initial administrator account for the site.
wp core install --url=http://localhost --title="My WordPress Site" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --allow-root


exec php-fpm7.3 -F -R