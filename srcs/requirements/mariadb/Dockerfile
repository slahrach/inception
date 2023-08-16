FROM debian:stable

RUN apt-get update && apt-get install -y mariadb-server && apt-get -y install systemctl

COPY create.sh /create.sh
COPY init.sql /mariadb-conf.d/init.sql
COPY my.cnf /etc/mysql/my.cnf
RUN chmod +x /create.sh

CMD ["./create.sh"]