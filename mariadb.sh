#!/bin/bash

sudo apt install mariadb-server mariadb-client -y
echo "Change mysql root password (default none password)"
sudo mysql_secure_installation

exit 0