#!/bin/bash

service mysql start

sleep 3

mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* to '$DB_USER'@'%';"

mysql -u root -e "FLUSH PRIVILEGES;"

service mysql stop

mysqld_safe



# #!/bin/bash

# if [ ! -d /var/run/mysqld ]; then
#  mkdir /var/run/mysqld
# fi
# if [ ! -d /run/mysqld ]; then
#  mkdir /run/mysqld
# fi

# if [ ! -d /var/lib/mysql/mysql ]; then
#  mysql_install_db --user=root
# fi

# if [ ! -d /var/log/mysql/ ]; then
#  mkdir /var/log/mysql/ && chown -R root:root /var/log/mysql && touch /var/log/mysql/error.log
# fi

# service mysql start && sleep 5

# # Create a new database
# mysql -e "CREATE DATABASE ${DB_NAME};"

# # Create a new user and grant permissions
# mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
# mysql -u root --password=${DB_ROOT_PASSWORD} -e "use mysql; update user set password = password('${DB_ROOT_PASSWORD}') , plugin = '' where user = 'root';"
# # Flush the privileges
# mysql -e "FLUSH PRIVILEGES;"

# service mysql stop


# mysqld_safe
