#!/bin/bash

echo "Nginx installation"
sudo apt install nginx -y
echo "Nginx settings"
sudo chown $USER:$USER /etc/nginx/nginx.conf
sudo cp ~/luravele/nginx/nginx.conf /etc/nginx/nginx.conf
sudo chown root:root /etc/nginx/nginx.conf
sudo chown $USER:$USER /etc/nginx/sites-available/default
sudo cp ~/luravele/nginx/default /etc/nginx/sites-available/default
sudo chown root:root /etc/nginx/sites-available/default

exit 0