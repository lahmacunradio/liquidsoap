FROM wordpress:php7.1-apache

WORKDIR /var/www/html

# copy to source destination 
# otherwise container will overwrite 
# themes added below
# see entrypoint.sh

COPY wp-content/themes/lahma /var/www/html/wp-content/themes/lahma/
COPY wp-content/themes/stable /var/www/html/wp-content/themes/stable/



