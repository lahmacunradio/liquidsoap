FROM wordpress:php7.1-apache


WORKDIR /var/www/html

# copy to source destination
# otherwise container will overwrite
# themes added below
# see entrypoint.sh

COPY --chown=www-data:www-data wp-content /var/www/html/wp-content
