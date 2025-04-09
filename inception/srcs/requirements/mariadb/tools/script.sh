#!/bin/bash

    mysqld_safe --skip-grant-tables --skip-networking & (\
    sleep 3
    
    mysql -u root  -e "FLUSH PRIVILEGES;"
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_USER_PASSWORD';"
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    
    killall -15 mysqld
    killall -15 mysqld_safe
    )

echo "Starting mariadb ..."
wait
echo "Done."
mysqld_safe
exec $@2
