#!/bin/bash

echo "Please, type new password for user dev"
read -s -p "Enter password: " item
echo ""
read -s -p "Retype password: " item2
echo ""

if [ $item != $item2 ]
then
    echo "Passwort input error (PWD non retype PWD)"
    export RESULT="0"
    exit 1
fi

sudo groupadd dev
sudo useradd -g dev -p $item -s /bin/bash -m dev
echo "dev:$item" | sudo chpasswd
sudo chown -R dev:dev /var/www
#sudo chmod -R 755 $(find /var/www -type d)
#sudo chmod -R 644 $(find /var/www -type f)

exit 0