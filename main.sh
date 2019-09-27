#!/bin/bash
#start of script
#This script is used for when Linux users are lazy or new to the system and need to use the cli for their couchdb database, this tool utilizes curl for easy use. This tool may be painful to make but who cares lol

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

if [ ! $1 ]; then echo "Usage: ./main.sh <dbip>"

dbip=$1
