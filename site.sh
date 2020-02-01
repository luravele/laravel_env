#!/bin/bash

read -p "Enter sitename: " item
echo ""
read -p "Enter php type (7.2 or 7.3): " item2
echo ""

sudo chown $USER:$USER /etc/nginx/sites-available
sudo chown $USER:$USER /etc/nginx/sites-enabled
sed 's/#SITE_NAME#/'$item'/;s/#PHP_VERSION#/'$item2'/' ./nginx/site_mask.conf | sudo cat > /etc/nginx/sites-available/${item}
sudo ln -s /etc/nginx/sites-available/$item /etc/nginx/sites-enabled/$item
sudo chown root:root /etc/nginx/sites-available
sudo chown root:root /etc/nginx/sites-enabled

sudo apt install git -y
sudo git clone https://github.com/laravel/laravel.git /var/www/$item

echo "hello" > /var/www/$item/public/index.html
sudo chown -R dev:dev /var/www/$item
sudo chmod -R 755 $(find /var/www/$item -type d)
sudo chmod -R 644 $(find /var/www/$item -type f)
sudo service nginx restart

cd /var/www/$item

if [ $1 == "with-db" ]
then
    ${APP}createdb.sh env /var/www/$item
else
    sudo -u dev cp .env.example .env
fi

sudo -u dev composer install
sudo -u dev php artisan key:generate

exit 0
