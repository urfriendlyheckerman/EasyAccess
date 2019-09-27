#!/bin/bash
#start of script - EasyAccess 
#This script is used for when Linux users are lazy or new to the system and need to use the cli for their couchdb database, this tool utilizes curl for easy use. This tool may be painful to make but who cares lol

#root check
#if [ "$(id -u)" != 0 ]; then 
  #echo "This script requires root. 'sudo su $0'"
  #exit 1
#fi

#VARS
  #colours
BLUE='\e[34m'
YELLOW='\e[33m'
GREEN='\e[32m'
BLACK='\e[30m'
WHITE='\e[97m'
CYAN='\e[36m'
GRAY='\e[90m'
MAGENTA='\e[35m'
END='\e[0m'
  #text format
DIM='\e[2m'
UL='\e[4m'
HIDE='\e[8m'
BLINK='\e[5m'
BOLD='\e[1m'
REV='\e[7m'
#END_OF_VARS

#if [ ! $1 ]; then echo "Usage: ./main.sh <dbip>"

#dbip=$1

#functions
banner() {
  figlet easyaccess
  echo ""
  echo "|------------------------------------------|"
  echo "| Welcome to the tool, enjoy your stay :)  |"
  echo "| Coded by urfriendlyheckerman, best hakka |"
  echo "|------------------------------------------|"
  sleep 2.3
}

pause() {
  local message="$@"
  [ -z $message ] && message="Press [Enter] to continue"
  read -p "$message" readEnterKey
}
}
menu() {

}
roptions() {
  local choice 
  read -p "Choose the option: " choice
  case $choice in 
    1) ;;
    2) ;;
    3) ;;
    4) ;;
    5) ;;
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
#https://www.javatpoint.com/nodejs-couchdb
#https://www.javatpoint.com/python-couchdb
#https://www.javatpoint.com/java-couchdb
#https://www.javatpoint.com/php-couchdb
