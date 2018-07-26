seed:
	mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"
	mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DB} < ./db/test.sql

test: clean seed test_unit clean

test_unit:
	php vendor/phpunit/phpunit/phpunit --no-configuration tests

composer:
	wget -o composer-setup.php https://getcomposer.org/installer
	php composer-setup.php
	rm composer-setup.php
	./composer.phar --profile --no-interaction --optimize-autoloader install

clean:
	mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} -e "DROP DATABASE \`${MYSQL_DB}\`;"
