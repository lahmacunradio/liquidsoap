#MAKE SURE YOU REPLACE THE FOLLOWING: 
#STEP 1: 
# - URL of server
#STEP 3: 
# - DB user name
# - DB name
#STEP 4: 
# - DB user name
# - DB name
# - URL of server

echo "STEP 1: downloading files" 
rm uploads.zip
curl -O [URL_SERVER]/uploads.zip
rm mockup_db.dump
curl -O [URL_SERVER]/mockup_db.dump
read -p "Press enter to continue"

echo "STEP 2: unzipping and copying upload files"
rm -R wp/wp-content/uploads
unzip uploads.zip
read -p "Press enter to continue"

echo "STEP 3: importing DB (enter DB pwd)"
mysql -u [DB_USER] -p [DB_NAME] < mockup_db.dump

echo "STEP 4: updating host name"
mysql -u [DB_USER] -p [DB_NAME] <<EOF
update wp_options set option_value='[SERVER_URL]' where option_name='home';
update wp_options set option_value='[SERVER_URL]' where option_name='siteurl';
EOF