#!/bin/sh
echo "Maintaining Dynamic DNS for $DDNS_HOSTNAME"
while true; do
    WANIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
    CURIP=$(dig +short $DDNS_HOSTNAME @resolver1.opendns.com)
    if [ "$WANIP" != "$CURIP" ]; then
        echo -n "Updating $DDNS_HOSTNAME to $WANIP: "
        echo $(curl -sS "https://dynamicdns.key-systems.net/update.php?hostname=${DDNS_HOSTNAME}&password=${PASS}&ip=auto")
    elif [ $DEBUG ]; then
        echo "DDNS OK"
    fi
    sleep 3600
done
