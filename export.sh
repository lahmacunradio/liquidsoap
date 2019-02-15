#MAKE SURE YOU REPLACE THE FOLLOWING: 
#STEP 1: 
# - DB user
# - DB name
#STEP 3: 
# - server URL
# - URL postfix

echo "STEP 1: Creating DB dump (enter pwd local DB)" 
mysqldump -u [DB_USER] -p [DB_NAME] > mockup_db.dump
read -p "Press enter to continue"

echo "STEP 2: Zipping upload files"
rm uploads.zip
zip -r uploads.zip wp/wp-content/uploads/
read -p "Press enter to continue"

echo "STEP 3: Uploading files (enter pwd SFTP server)"
sftp root@[SERVER_URL]:/var/www/html/[POSTFIX]  <<< $'put mockup_db.dump'
sftp root@[SERVER_URL]:/var/www/html/[POSTFIX]  <<< $'put uploads.zip'
