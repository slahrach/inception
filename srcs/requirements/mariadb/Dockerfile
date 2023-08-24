FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y mariadb-server

COPY create.sh script.sh

COPY my.cnf /etc/mysql/my.cnf

RUN chmod +x script.sh

EXPOSE 3306

CMD ["./script.sh"]

# FROM debian:buster

# RUN apt-get update && apt-get install -y mariadb-server

# COPY create.sh /create.sh
# COPY my.cnf /etc/mysql/my.cnf
# RUN chmod +x /create.sh

# CMD ["./create.sh"]