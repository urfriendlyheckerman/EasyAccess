#!/bin/bash
#start of script - EasyAccess 
#This script is used for when Linux users are lazy or new to the system and need to use the cli for their couchdb database, this tool utilizes curl for easy use. This tool may be painful to make but who cares lol

#TODO:
#Add a feature so it remembers your database ip and/or if you change database ip's then you can enter a new one and it will remember it
#Use node.js and/or python with this to help, maybe idk

#root check
#if [ "$(id -u)" != 0 ]; then 
  #echo "This script requires root. 'sudo su $0'"
  #exit 1
#fi

#VARS
  #random_vars
TIME=2.5  
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

#if [ ! $1 ]; then echo "Usage: ./main.sh <dbip> <dbport>"

#dbip=$1
#dbport=$2

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
  echo "[5] Create a Database User"
  echo "[6] Documents"
  
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
cuser() {
  read -p "Username you want to create: " user
  #finding a way with curl xD
}
doc() {
  #whole new menu haha
  menu2() {
    clear
    echo "This is the document parts of the program! In this area you will be able to control all your documents. Have fun ;) "
    echo "-----------------------------------------------------------------"
    echo ""
    echo "NOTE - For this you will need to know the basic syntax of JSON!"
    sleep 5
    clear
    echo ""
    echo "|------------------|"
    echo "| Document Options |"
    echo "|------------------|"
    echo ""
    echo "[1] Create Document"
    echo "[2] Delete Document"
    echo "[3] Edit Document"
    echo "[4] Download Document"
    echo "[0] Go Back"
  }
  cdoc() {
    echo -n "Whats the Database you want to use: "
    read dbname4
    echo -n "ID for Document: "
    read idnum
    echo -n "Now enter the Document Contents: "
    read doccon
    curl -X PUT http://$dbip:$dbport/$dbname4/"$idnum" -d ' { $doccon } '
  }                                    
  roptions2() {
    local choice
    read -p "Choose an option: " choice2
    case $choice2 in
      1) cdoc ;;
      2) deldoc ;;
      3) edoc ;;
      4) ddoc ;;
      0) gbk ;;
      *) echo "Error..."
    esac
  }
  while true
  do
    menu2
    roptions2
  done
}

roptions() {
  local choice 
  read -p "Choose an option: " choice
  case $choice in 
    1) chdb ;;
    2) cdb ;;
    3) deldb ;;
    4) dbinf ;;
    5) cuser ;;
    6) doc ;;
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
