-- will create the databases that will contain all the tables needed by wordpress
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

-- This would be the user that WordPress will use to connect to the database.
-- Note that in order to connect from outside the container, we will pass % wildcard.
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';

-- The user will not have access to do CRUD operations on the database, thus we need to give privileges to that user.
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';

FLUSH PRIVILEGES;