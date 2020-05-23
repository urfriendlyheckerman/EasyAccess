#!/bin/bash

#root check
if [ "$(id -u)" != 0 ]; then 
  echo "This script requires root. 'sudo su $0'"
  exit 1
fi

#VARS
TIME=2.5

BLUE='\e[34m'
YELLOW='\e[33m'
GREEN='\e[32m'
BLACK='\e[30m'
WHITE='\e[97m'
CYAN='\e[36m'
GRAY='\e[90m'
MAGENTA='\e[35m'
END='\e[0m'

DIM='\e[2m'
UL='\e[4m'
HIDE='\e[8m'
BLINK='\e[5m'
BOLD='\e[1m'
REV='\e[7m'
#END_OF_VARS

if [ ! $1 ]; then echo "Usage: ./main.sh <dbip> <dbport>"

dbip=$1
dbport=$2

#functions
banner() {
  figlet easyaccess
  echo ""
  echo "|------------------------------------------|"
  echo "| Welcome to the tool, enjoy your stay :)  |"
  echo "| Coded by urfriendlyheckerman, best hakka |"
  echo "|------------------------------------------|"
  sleep 2.3
  clear
}

pause() {
  local message="$@"
  [ -z $message ] && message="Press [Enter] to continue"
  read -p "$message" readEnterKey
}

menu() {
  clear
  echo "Welcome to the tool! Here you will be able to do a variety of options for your database! :)"
  echo ""
  system() {
    VERSION=`cat /etc/os-release | grep -i ^PRETTY`
    if [ -f /etc/os-release ]
    then 
      echo "Your system version is $VERSION"
    else
      echo "System not supported"
    fi
  }
  echo "-----------------------------------------------------------------"
  system
  echo "-----------------------------------------------------------------"
  echo ""
  echo "[1] Check all Databases"
  echo "[2] Create a Database"
  echo "[3] Delete a Database"
  echo "[4] Get Database Info"
}

chdb() {
  curl -X GET http://$dbip:$dbport/_all_dbs
}
cdb() {
  read -p "Name of database you want to create: " dbname
  curl -X PUT http://$dbip:$dbport/$dbname
}
deldb() {
  read -p "Database you want to delete: " dbname2
  curl -X DELETE http://$dbip:$dbport/$dbname2
}
dbinf() {
  read -p "Database Name: " dbname3
  curl -X GET http://$dbip:$dbport/$dbname3
}

roptions() {
  local choice 
  read -p "Choose an option: " choice
  case $choice in 
    1) chdb ;;
    2) cdb ;;
    3) deldb ;;
    4) dbinf ;;
    99) exit 1 ;; 
    *) echo "Error..."
  esac  
}

banner

trap '' SIGNIT SIGQUIT SIGTSTP

while true
  do
    menu
    roptions
done
