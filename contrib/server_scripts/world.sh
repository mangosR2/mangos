#!/bin/bash
lockfile=/var/lock/mangos
cd ~
while true; do
    ulimit -c unlimited
    ~/bin/core_parser.sh
    logger -p user.warn -t mangos "Starting worldd realm 2..."
    cat ~/log/worldd.log|grep ERROR >>~/log/error.log
    ~/bin/mangos-worldd
    rm -f ~/worldd.pid
    [ ! -f $lockfile ] && break
    screen -X hardcopy -h /home/mangos/log/dump/`date +%Y%m%d%H%M`dump.log
    # send log by mail here
    logger -p user.warn -t mangos " worldd stopped. Restarting..."
    sleep 1
done
