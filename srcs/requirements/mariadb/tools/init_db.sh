#!/bin/bash

set -e

# lance serveur
mysqld_safe &

# att mariaDB ready
until mysqladmin ping --silent; do
	sleep 1
done

# secu et cration db
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root shutdown

# lance premier plan
exec mysqld_safe