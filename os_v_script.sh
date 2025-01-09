#!/bin/bash

#colors callout
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'
#end of colors callout

#OS version callout

echo -e "${BOLD}${BLUE}==Checking OS Version==${RESET}"
echo -e "\n${BOLD}${YELLOW} OS Version:${RESET}"
cat /etc/os-release
echo  ""
#==================


#BASH users callout
echo -e "\n${BOLD}${YELLOW}Users with BASH shell:${RESET}"
if [ -f /etc/passwd ]; then
BASH_USERS="$(grep '/bin/bash' /etc/passwd)"
if [ -n "$BASH_USERS" ]; then
echo -e "${GREEN}$BASH_USERS${RESET}"
else
echo -e "${RED}There are no users with BASH shell access${RESET}"
fi
else
echo -e "${RED}file passwd not found!${RESET}"
fi
#=================

#Open ports callout
echo -e "\n${BOLD}${YELLOW}Checking for opne ports in the system:${RESET}"
if command -v nmap $> /dev/null; then
	echo -e "${CYAN}Ports scanning...${RESET}"
	nmap -sT -n 127.0.0.1
else
	echo -e "${RED}nmap absent in the system! cannot perform requested command!${RESET}"
	echo -e "please install nmap and retry"
fi

if command -v lsof &> /dev/null; then
sudo lsof -i -P -n | grep LISTEN
else 
echo -e "${RED}lsof is absent in the system!${RESET}"
echo -e "please try installing lsof and retry"
fi

echo ""

echo -e "\n${BOLD}${BLUE}==END of REPORT==${RESET}\n"
