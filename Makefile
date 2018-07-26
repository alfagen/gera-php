all: composer configs env seed test

seed:
	env | grep ENV
	bundle exec rake db:drop RAILS_ENV=test || echo 'database does not exist'
	bundle exec rake db:setup RAILS_ENV=test
	mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DB} < ./db/test.sql

configs:
	rm -f app/includes/config.inc.php && ln -s ./config.example.inc.php app/includes/config.inc.php
	rm -f config/database.yml && ln -s ./database.teamcity.yml config/database.yml

env:
	export HTTP_HOST=kassa.cc REMOTE_ADDR=127.0.0.1
	export RAILS_ENV=test PHP_ENV=test

test:
	php app/vendor/phpunit/phpunit/phpunit --no-configuration tests

composer:
	composer --profile --no-interaction --optimize-autoloader install
