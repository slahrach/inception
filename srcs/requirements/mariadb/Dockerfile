FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

COPY init.sql /docker-entrypoint-initdb.d/

# Expose port 9000 for php-fpm
EXPOSE 3306

CMD ["mysqld"]