#!/bin/bash
##Author=UmuT_KaRa
#http://www.network-science.de/ascii/
#cyberlarge
banner() {
	echo
	echo -e "\e[32m

_______ __   _ ______   ______  _____  _____ ______ 
 |_____| | \\  | |     \\ |_____/ |     |   |   |     \\
 |     | |  \\_| |_____/ |    \\_ |_____| __|__ |_____/
                                                     

 _     _ _______ _______ _     _
 |_____| |_____| |       |____/
 |     | |     | |_____  |    \_
                                                                 


                \e[1;33m
 [*] TELEGRAM \e[1;31m>>\e[1;32m t.me/termuxegitimm\e[1;33m

 [*] İNSTAGRAM \e[1;31m>>\e[1;32m @termuxegitim\e[1;33m

 [*] YOUTUBE \e[1;31m>> \e[1;32myoutube.com/channel/UCE3QvczZXklHSAaRFwDLP5g\e[1;33m

 [*] GİTHUB \e[1;31m>> \e[1;32mgithub.com/termux-egitim

		\e[0m
		" |lolcat
}
if [[ -a /data/data/com.termux/files/usr/bin/lolcat ]];then
	banner
else
	echo
	echo
	echo
	printf "\e[31m[!] LOLCAT PAKETİ BULUNAMADI "
	echo
	echo
	sleep 2
	printf "\e[32m[*] LOLCAT PAKETİ YÜKLENİYOR.. "
	pkg install ruby -y
	gem install lolcat
	banner
fi
