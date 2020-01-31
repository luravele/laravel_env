#!/bin/bash

echo "Please enter root user MySQL password!"
echo "Note: password will be hidden when typing"
read -sp "Root password: " rootpasswd
echo ""
read -p "Please enter new database name: " dbname
echo ""
read -sp "Please enter password for new database: " dbpassword
echo ""

sudo mysql -u root -p${rootpasswd} -e "CREATE DATABASE $dbname"
sudo mysql -u root -p${rootpasswd} -e "CREATE USER '${dbname}' IDENTIFIED BY '${dbpassword}';"
sudo mysql -u root -p${rootpasswd} -e "GRANT ALL ON *.* TO '${dbname}'@localhost IDENTIFIED BY '${dbpassword}';"

if [ $1 = 'env' ]
then
    sudo -u dev cp ${2}/.env ${2}/.env.old
    sed 's/DB_HOST=127.0.0.1/DB_HOST=localhost/;s/DB_DATABASE=laravel/DB_DATABASE='${dbname}'/;s/DB_USERNAME=root/DB_USERNAME='${dbname}'/;s/DB_PASSWORD=/DB_PASSWORD='${dbpassword}'/' ${2}/.env.example | sudo -u dev bash -c "cat > ${2}/.env"
fi

exit 0