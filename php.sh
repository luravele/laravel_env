#!/bin/bash

read -p "Enter php type (7.2 or 7.3): " item
echo ""

sudo apt install php$item-fpm php$item-common php$item-curl php$item-json php$item-mbstring php$item-mysql php$item-xml php$item-zip -y

exit 0