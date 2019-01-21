FROM wordpress:php7.1-apache


WORKDIR /var/www/html

# copy to source destination
# otherwise container will overwrite
# themes added below
# see entrypoint.sh

COPY --chown=www-data:www-data maker /var/www/html/wp-content/themes/maker
COPY --chown=www-data:www-data lahma_maker /var/www/html/wp-content/themes/lahma_maker
COPY --chown=www-data:www-data uploads /var/www/html/wp-content/uploads/
