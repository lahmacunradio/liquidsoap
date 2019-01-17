FROM wordpress:php7.1-apache

#RUN apt-get update && apt-get install unzip -y

WORKDIR /var/www/html

# copy to source destination
# otherwise container will overwrite
# themes added below
# see entrypoint.sh

COPY lahma /var/www/html/wp-content/themes/lahma/
COPY stable /var/www/html/wp-content/themes/stable/
COPY lahma_maker /var/www/html/wp-content/themes/lahma_maker
COPY uploads /var/www/html/wp-content/uploads/
