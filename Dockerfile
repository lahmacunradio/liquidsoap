FROM wordpress:php7.1-apache

WORKDIR /var/www/html

# copy to source destination 
# otherwise container entrycmd will overwrite 
# themes added during image build
# see more at wordpress docker image -> entrypoint.sh

COPY lahma /var/www/html/wp-content/themes/lahma/
COPY stable /var/www/html/wp-content/themes/stable/



