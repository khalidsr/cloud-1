#!/bin/bash

sleep 10


cd /var/www/html

chown -R www-data:www-data /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp 

wp core download --allow-root

mv wp-config-sample.php  wp-config.php

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g"     wp-config.php

sed -i "s/username_here/$WORDPRESS_DB_USER/g"          wp-config.php

sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g"      wp-config.php

sed -i "s/localhost/mariadb/g"              wp-config.php 

echo "define('WP_CACHE_KEY_SALT', 'sriyani.42.fr');" >> wp-config.php
echo "define('WP_REDIS_PORT', '6379' );" >> wp-config.php 
echo "define('WP_CACHE',       true );" >> wp-config.php 

wp core install --url=sriyani.42.fr --title=inception --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=jojo@ko.com --skip-email --allow-root
wp user create $WORDPRESS_USER  --user_pass=$WORDPRESS_USER_PASSWORD khalid@example.com  --role=author  --allow-root

mkdir /run/php


/usr/sbin/php-fpm7.3 -F

exec $@
