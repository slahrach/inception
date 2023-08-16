# Base image with Debian
FROM debian:buster

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    php \
    php-fpm \
    php-mysql \
    php-mbstring \
    php-gd \
    mariadb-client

# Set the working directory
RUN mkdir -p /var/www/html

WORKDIR /var/www/html
#By default, PHP-FPM is often configured to listen only on 127.0.0.1:9000,
#which means it accepts connections only from the local machine.
#If you want your PHP-FPM to accept connections from other devices (in this case, your domain name login.42.fr pointing to your local IP address)
#you should change the listen directive to 0.0.0.0:9000. 
#This configuration makes PHP-FPM listen on all available network interfaces.

#sed OPTIONS 'COMMANDS' FILE
#-i in-place editing of the file: changes will be made directly to the file specified, without creating a separate output file
#s command, which stands for substitute, to replace one string with another
#s/pattern/replacement/
RUN sed -i 's~listen = /run/php/php7\.3-fpm\.sock~listen = 9000~' /etc/php/7.3/fpm/pool.d/www.conf

# Download and install WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp


# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 9000 for php-fpm
EXPOSE 9000

# Entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
