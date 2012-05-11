#!/bin/bash

logfile=error_gdb.log;
logtime=`date `;

corefiles=`find ~/ -maxdepth 1 -name core*`
for i in $corefiles; do
echo "Crash time: $logtime " >> ~/$logfile
gdb ~/bin/mangos-worldd -c $i -n --batch --command=~/bin/bt.sh >>~/$logfile
rm $i
done
