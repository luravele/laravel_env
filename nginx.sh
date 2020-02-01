#!/bin/bash

echo "Nginx installation"
sudo apt install nginx -y
echo "Nginx settings"
sudo cp /usr/lib/luravele/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp /usr/lib/luravele/nginx/default /etc/nginx/sites-available/default
service nginx restart

exit 0