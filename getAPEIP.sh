#!/bin/sh

IP="$(snmpwalk -v 2c -c public -O e 10.0.1.1 ipAdEntAddr IpAddress | 
grep -v ' 10.\| 169.254\| 127.0.\| 172.[16\-32]\| 192.168' | 
cut -d: -f4| 
sed 's/ //g')"

echo $IP
