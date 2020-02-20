#!/bin/bash

GREEN='\033[0;32m'	#  ${GREEN}	# зелёный цвет знаков
NORMAL='\033[0m'	#  ${NORMAL}	# все атрибуты по умолчанию
CYAN='\033[0;36m'       #  ${CYAN}      # цвет морской волны знаков
RED='\033[0;31m'       #  ${RED}      # красный цвет знаков
OP=4
export APP=/usr/lib/luravele/

if [ "$EUID" -ne 0 ]
  then echo -e "${RED}Please run as root ('sudo -i' for Ubuntu)${NORMAL}"
  exit
fi

reset
    sudo chmod +x ${APP}php.sh
    sudo chmod +x ${APP}user.sh
    sudo chmod +x ${APP}nginx.sh
    sudo chmod +x ${APP}mariadb.sh
    sudo chmod +x ${APP}createdb.sh
    sudo chmod +x ${APP}site.sh

if [ ! -f /usr/local/bin/luravele ]
then
    sudo chown $USER:$USER /usr/local/bin
    ln -s /usr/lib/luravele/menu.sh /usr/local/bin/luravele
    sudo chown root:root /usr/local/bin
fi

echo -e "${GREEN}"
echo -e "			************************************************"
echo -e "			*                                              *"
echo -e "			*                LURAVELE ENV                  *"
echo -e "			*                                              *"
echo -e "			*             1. Install ENV                   *"
echo -e "			*             2. Add new site widthout DB      *"
echo -e "			*             3. Add new site with DB          *"
echo -e "			*             4. Create new DB                 *"
echo -e "			*                                              *"
echo -e "			*             0. Exit                          *"
echo -e "			*                                              *"
echo -e "			************************************************"
echo -e "${NORMAL}"

read -p "Select option[0-4]: " OPTION


if [ $OPTION = 0 ]
then 
    exit 0
fi

if [ $OPTION = 1 ]
then
    echo -e "${CYAN}[Operation 1/$OP]:Create user for development${NORMAL}"
    ${APP}user.sh
echo "RES=$?"
    if [ $? != "0"  ]
    then
	echo -e "${RED}Error in create user${NORMAL}"
	exit 1
    fi
    
    echo -e "${CYAN}[Operation 2/$OP]:Nginx installation${NORMAL}"
    ${APP}nginx.sh

    echo -e "${CYAN}[Operation 3/$OP]:PHP installation${NORMAL}"
    ${APP}php.sh

    echo -e "${CYAN}[Operation 4/$OP]:MariaDB installation${NORMAL}"
    ${APP}mariadb.sh

fi

if [ $OPTION = 2 ]
then
    echo -e "${CYAN}New site installation${NORMAL}"
    ${APP}site.sh
fi

if [ $OPTION = 3 ]
then
    echo -e "${CYAN}New site installation and DB create${NORMAL}"
    ${APP}site.sh with-db
fi

if [ $OPTION = 4 ]
then
    echo -e "${CYAN}Create new DB${NORMAL}"
    ${APP}createdb.sh
fi

${APP}menu.sh
