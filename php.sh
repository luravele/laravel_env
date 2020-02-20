#!/bin/bash

read -p "Enter php type (7.2 or 7.3): " item
echo ""

sudo apt install php$item-fpm php$item-common php$item-curl php$item-json php$item-mbstring php$item-mysql php$item-xml php$item-zip -y
sudo apt install composer
sudo cp /usr/lib/luravele/php/pool.d/www.conf /etc/php/${item}/fpm/pool.d/www.conf
service php${item}-fpm restart

exit 0