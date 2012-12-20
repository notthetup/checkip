histlogfile="$HOME/.checkip/iphist.log"

ipaddr=$(curl -s http://ipecho.net/plain )

if [ -f $histlogfile ]; then
    lastip=$(tail -n 1 $histlogfile)
else
    lastip="0"
fi

if  [ "$lastip" != "$ipaddr" ]; then
    date +%c >> $histlogfile
    echo $ipaddr >> $histlogfile
fi