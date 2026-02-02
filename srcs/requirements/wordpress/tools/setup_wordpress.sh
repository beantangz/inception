#!/bin/bash

set -e

DB_HOSTNAME="${DB_HOST%%:*}"
DB_PORT="${DB_HOST##*:}"
if [ "$DB_PORT" = "$DB_HOSTNAME" ]; then
    DB_PORT=3306
fi

until mysqladmin ping -h "$DB_HOSTNAME" -P "$DB_PORT" -u$MYSQL_USER -p$MYSQL_PASSWORD --silent; do
    echo "Waiting for MariaDB..."
    sleep 1
done

cd /var/www/html

if [ ! -f wp-config.php ]; then
	wp core download --allow-root

	wp config create \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=$DB_HOST \
		--allow-root

	wp core install \
		--url=https://$DOMAIN_NAME \
		--title="$WP_TITLE" \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root

	wp user create \
		$WP_USER $WP_USER_EMAIL \
		--user_pass=$WP_USER_PASSWORD \
		--allow-root
fi

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

exec php-fpm8.2 -F
