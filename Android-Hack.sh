#!/bin/bash
##Author=UmuT_KaRa
clear
B="\e[0m"
K="\e[31m"
Y="\e[32m"
S="\e[33m"
M="\e[34m"
C="\e[36m"
menu() {
cd Files
bash banner.sh
printf "

$B
[\e[32m1$B]$Y TROJAN APK OLUŞTUR$B

[\e[32m2$B]$Y DİNLEMEYE AL$B

[\e[31mX$B]$K ÇIKIŞ$B
"
echo
echo
echo
read -p $'\e[31m──────────────[\e[32mANDROİD HACK\e[31m]───────►  \e[0m' secim
echo
echo
echo
if [[ $secim == 1 ]];then
	bash Trojan-oluştur.sh
	cd ..
	echo
	echo
	echo
	printf "[$Y*$B]$Y TROJAN APK OLUŞTURULDU.."
	echo
	echo
	echo
	sleep 2
	bash Android-Hack.sh
elif [[ $secim == 2 ]];then
	bash Dinleme.sh
	cd ..
	sleep 2
	bash Android-Hack.sh
elif [[ $secim == x || $secim == X ]];then
	echo
	echo
	echo
	printf "$K[!]$B ÇIKIŞ YAPILDI.."
	echo
	echo
	echo
	exit
elif [[ $secim == d || $secim == D || $secim == düzenle || $secim == DÜZENLE ]];then
	cd ..
	vim Android-Hack.sh
	bash Android-Hack.sh
else
	echo
	echo
	echo
	printf "$K[!]$B HATALI SEÇİM $K!!!"
	echo
	echo
	echo
	cd ..
	sleep 1
	bash Android-Hack.sh
fi


}

########## KURULUM YAP ##########
kurulum() {
echo
echo
echo
printf "[$Y*$B]$Y KURULUM YAPILIYOR..$B"
echo
echo
sleep 1
printf "[$Y*$B]$Y METASPLOİT-FRAMEWORK KURULUYOR..$B"
echo
echo
sleep 1
printf "[$Y*$B]$Y LÜTFEN BEKLEYİNİZ KURULUM BİRAZ UZUN SÜREBİLİR.."
echo
echo
echo
sleep 1
pkg install unstable-repo -y
pkg install metasploit -y
pkg install ruby -y
gem install lolcat
echo
echo
echo
printf "[$Y*$B]$Y KURULUM TAMAMLANDI..$B"
echo
echo
echo
}


if [[ -a /data/data/com.termux/files/usr/bin/msfconsole ]];then
	menu
else
	kurulum
fi

