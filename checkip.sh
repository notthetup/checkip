histlogfile="$HOME/.checkip/iphist.log"
ValidIpAddressRegex="^([0-9]{1,3}\.){3}[0-9]{1,3}$";
count=0;

until [[ ("$ipaddr" =~ $ValidIpAddressRegex) || ($count > 5) ]] ; do
    ipaddr=$(bash /home/chinmay/.checkip/getAPEIP.sh)
    count=$[count+1];
done

if [ -f $histlogfile ]; then
    lastip=$(tail -n 1 $histlogfile)
else
    lastip="0"
fi


if [[ "$ipaddr" =~ $ValidIpAddressRegex ]] ; then
    if  [ "$lastip" != "$ipaddr" ]; then
    	date +%c >> $histlogfile
    	echo $ipaddr >> $histlogfile
    else
    	echo -ne "-" >> $histlogfile
	date +%c >> $histlogfile
    	echo $ipaddr >> $histlogfile
    fi
else
    	date +%c >> $histlogfile
    	echo "No DNS :(" >> $histlogfile
fi
