#!/bin/bash

#font colors

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

clear

#add users

echo -ne "${YELLOW}Enter the username : "; read username
echo -ne "Enter password (please use a strong password) : "; read password; break;;
echo -ne "Enter No. of Days till expiration : ";read nod
exd=$(date +%F  -d "$nod days")
chage -E $exd $username && echo "$username:$password" | chpasswd &&
clear &&
echo -e "${GREEN}User Detail" &&
echo -e "${RED}-----------" &&
echo -e "${GREEN}\nUsername :${YELLOW} $username" &&
echo -e "${GREEN}\nPassword :${YELLOW} $password" &&
echo -e "${GREEN}\nExpire Date :${YELLOW} $exd ${ENDCOLOR}" ||
echo -e "${RED}\nFailed to modify user $username please try again.${ENDCOLOR}"

#return to panel

echo -e "\nPress Enter key to return to main menu"; read
menu
