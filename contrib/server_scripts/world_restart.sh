#!/bin/bash
lockfile="/var/lock/mangos"

if [ -f $lockfile ]; then
   rm -f $lockfile
fi

expect ~/bin/mangos_cmd.exp .announce "Server shutdown after operation system request."
sleep 1
expect ~/bin/mangos_cmd.exp .server shutdown "60"

    for (( i=1; $i<12; i++)); do
    sleep 10
    echo -n .
    ps1=`ps -U mangos|grep worldd|sed 's/^ //'|sed 's/ .*//'`
    [ -z "$ps1" ] && break
    done

echo
if [ -f ~/worldd.pid ]; then
    # Critical reboot
    kill -9 $(ps -U mangos |grep worldd|sed 's/^ //'|sed 's/ .*//')
fi

