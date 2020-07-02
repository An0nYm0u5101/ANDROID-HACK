#!/bin/bash
##Author=UmuT_KaRa
echo
echo
ip=$(ifconfig |grep -o "destination [0.-9.]*" | tr -d "destination ")
localip=$(ifconfig |grep -o "inet 192.168.[0.-9.]*" | tr -d "inet ")
if [[ $localip == *"1"* ]];then
	printf "\e[0m@İp_Adresin\e[32m~\e[0m> \e[32m$localip"
elif [[ $ip == *"1"* ]];then
	printf "\e[0m@İp_Adresin\e[32m~\e[0m> \e[32m$ip"
fi
echo
echo
echo

