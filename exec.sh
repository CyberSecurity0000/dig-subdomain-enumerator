#!/bin/bash

# Encerra o script imediatamente ao apertar CTRL+C
trap "exit 1" INT

apres()
{
	clear

	# Cor vermelha
	echo -e "\033[01;31m"
	
	# Banner
	echo "
  _____      _               _____                      _ _          ___   ___   ___   ___  
 / ____|    | |             / ____|                    (_) |        / _ \ / _ \ / _ \ / _ \ 
| |    _   _| |__   ___ _ _| (___   ___  ___ _   _ _ __ _| |_ _   _| | | | | | | | | | | | |
| |   | | | | '_ \ / _ \ '__\___ \ / _ \/ __| | | | '__| | __| | | | | | | | | | | | | | | |
| |___| |_| | |_) |  __/ |  ____) |  __/ (__| |_| | |  | | |_| |_| | |_| | |_| | |_| | |_| |
 \_____\__, |_.__/ \___|_| |_____/ \___|\___|\__,_|_|  |_|\__|\__, |\___/ \___/ \___/ \___/ 
        __/ |                                                  __/ |                        
       |___/                                                  |___/                 
       
       Brute Force DNS - Dig"
       echo -e "\033[00;00m\n"
}

busca_subdomain()
{
        # Verde para destaque
        echo -e "\033[01;32m"
        echo -e "###########################################"
        echo -e "|->          Buscando SubDomain...      <-|"
        echo -e "###########################################"
        echo -e "\033[00;00m"
	
	while read -r team
	do
		dig $team.$2 @8.8.8.8 | grep -v ';\|SOA' | sed -r '/^\s*$/d' | grep $team

	done < "$1"
}

busca_subdomain_server()
{
        echo -e "\033[01;32m"
        echo -e "###########################################"
        echo -e "|->          Buscando SubDomain...      <-|"
        echo -e "###########################################"
        echo -e "\033[00;00m"

	while read -r team
	do	
		dig $team.$4 @$2 | grep -v ';\|SOA' | sed -r '/^\s*$/d' | grep $team

	done < "$3"
}

# Main
apres

# Controle
if [ $# -ge 1 ]
then
	
	case $1 in

	-s)	
		if [ $# -eq 4 ]
		then
			busca_subdomain_server "$1" "$2" "$3" "$4"
		else
			echo -e "\033[01;35m Usage: $0 -s 8.8.8.8 <wordlist> <domain>\033[00;00m"
		fi 
		;;
	
	
	-h)	echo -e "\033[01;33m Usage: $0 <wordlist> <domain>\033[00;00m"
		echo -e "\033[01;35m Usage: $0 -s 8.8.8.8 <wordlist> <domain>\033[00;00m"
		;;

	 *)
		if [ $# -eq 2 ]
		then
			busca_subdomain "$1" "$2"
		else
			echo -e "\033[01;34m Usage: $0 <wordlist> <domain>\033[00;00m"
		fi ;;

	esac
fi
