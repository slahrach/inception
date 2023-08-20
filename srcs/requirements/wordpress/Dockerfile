# Base image with Debian
FROM debian:buster

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    php \
    php-fpm \
    php-mysql \
    mariadb-client \
    mariadb-server \
    php-cgi \
    php-pdo \
    php-gd php-cli \
    php-mbstring

RUN rm -rf /var/www/html/*

RUN mkdir -p /var/www/html && chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

RUN sed -i 's~listen = /run/php/php7\.3-fpm\.sock~listen = 9000~' /etc/php/7.3/fpm/pool.d/www.conf

# Download and install WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp && mkdir -p /run/php


# COPY wp-config.php /var/www/html/wp-config.php

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 9000 for php-fpm
EXPOSE 9000

# Entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

