#!/bin/bash

echo "Nginx installation"
sudo apt install nginx -y
echo "Nginx settings"
sudo cp ~/luravele/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp ~/luravele/nginx/default /etc/nginx/sites-available/default

exit 0