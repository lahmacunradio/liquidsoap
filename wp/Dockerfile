FROM wordpress:php7.1-apache

#RUN apt-get update && apt-get install unzip -y

WORKDIR /var/www/html

# copy to source destination
# otherwise container will overwrite
# themes added below
# see entrypoint.sh

COPY --chown=www-data:www-data maker /var/www/html/wp-content/themes/maker
COPY --chown=www-data:www-data lahma_maker /var/www/html/wp-content/themes/lahma_maker
COPY --chown=www-data:www-data uploads /var/www/html/wp-content/uploads/
# deploy script webhook
COPY --chown=www-data:www-data deploy.php /var/www/html/deploy.php
