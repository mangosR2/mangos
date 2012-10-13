#!/bin/bash
###############################################################################
# configuration
#home="/home/mangos"
#mangosConf=$home"/etc/mangosd.conf"
#scriptConf=$home"/etc/scriptdev2.conf"
#mangosSource=$home"/Mangos-Sources/mangos"
#YTDBSource=$home"/Mangos-Sources/ytdbase"
echo "Please, setup directories and files in begin of this script!"
#
###############################################################################
# functions
function db_exec() 
{
    local IFS=$' \t\n'
    MYCMD='mysql --host='$1' --user='$3' --password='$4' --database='$5' --batch --silent --execute '
    echo $($MYCMD "$6")
}

function db_run()
{
    MYCMD='mysql --host='$1' --user='$3' --password='$4' --database='$5' '
    echo $($MYCMD <"$6")
}

function db_config_extract()
{
    echo `cat $1|grep "^"$2 |sed 's/^.*=\t*//'|sed 's/\"//g' |sed 's/\<//'|sed 's/\>//'|sed 's/\;/ /g'`
}
###############################################################################
# realm
searchDir=$mangosSource"/sql/updates"
dtemp=$(db_config_extract $mangosConf "LoginDatabaseInfo")
read realmhost realmport realmuser realmpass realmdb <<<$dtemp
count=0;

while [ ! -z $realmdb ]
do
    dblastupdate=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$realmdb"' AND TABLE_NAME='realmd_db_version' AND DATA_TYPE='bit'")
    updateFile=`grep -lir "COLUMN.$dblastupdate" $searchDir/`
#    echo $updateFile
#    echo $dblastupdate
#    exit
    if [ -z $updateFile ]; 
        then
            break;
    fi
    _rc=$(db_run $realmhost $realmport $realmuser $realmpass $realmdb "$updateFile")
    echo "Installed update "$updateFile" with rc="$_rc
    echo
    count=$(($count+1));
done

echo "Updating REALM DB completed. Count of updates:"$count
echo "Last update REALM DB: "$dblastupdate
echo

###############################################################################
# mangos
dtemp=$(db_config_extract $mangosConf "WorldDatabaseInfo")
read mangoshost mangosport mangosuser mangospass mangosdb <<<$dtemp

###############################################################################
searchDir=$mangosSource"/sql/updates"

dbverfull=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT version FROM db_version")
echo "Full version of MANGOS DB:" $dbverfull
count=0;

while [ ! -z $mangosdb ]
do
    dblastupdate=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$mangosdb"' AND TABLE_NAME='db_version_ytdb' AND DATA_TYPE='bit'")

    YTDBlastVer=`echo $dblastupdate|cut -c 1,2,3`
    YTDBnewVer=$(($YTDBlastVer+1));
    echo "Searching update version: "$YTDBnewVer

    YTDBDir=`echo $YTDBnewVer|cut -c 1,2`
    ytdbsearchDir=$YTDBSource"/R"$YTDBDir"/Updates/"

    updateFile=`find "$ytdbsearchDir" -maxdepth 1 -name "$YTDBnewVer"_mangos_FIX*.sql  |sort -n`
    if [ -z "$updateFile" ]; 
        then
            break;
    fi
    updateFileCore=`find "$ytdbsearchDir" -maxdepth 1 -name "$YTDBnewVer"_corepatch_mangos*.sql  |sort -n`
    if [ ! -z "$updateFileCore" ]; then
        echo "Found core update file: "$updateFileCore
        _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb "$updateFileCore")
        count=$(($count+1));
    fi

    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb "$updateFile")
    echo "Installed YTDB update "$updateFile" with rc="$_rc
    echo

    count=$(($count+1));
done

echo "Updating YTDB completed. Count of updates:"$count
echo "Last update YTDB: "$dblastupdate
echo

count=0;
while [ ! -z $mangosdb ]
do
    dblastupdate=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$mangosdb"' AND TABLE_NAME='db_version' AND DATA_TYPE='bit'")
    updateFile=`grep -lir "COLUMN.$dblastupdate" $searchDir/`
    if [ -z $updateFile ]; 
        then
            break;
    fi
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb "$updateFile")
    echo "Installed update "$updateFile" with rc="$_rc
    echo
    count=$(($count+1));
done

echo "Updating MANGOS DB completed. Count of updates:"$count
echo "Last update MANGOS DB: "$dblastupdate
echo

###############################################################################
# characters
dtemp=$(db_config_extract $mangosConf "CharacterDatabaseInfo")
read charhost charport charuser charpass chardb <<<$dtemp
count=0;

while [ ! -z $chardb ]
do
    dblastupdate=$(db_exec $charhost $charport $charuser $charpass $chardb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$chardb"' AND TABLE_NAME='character_db_version' AND DATA_TYPE='bit'")
    updateFile=`grep -lir "COLUMN.$dblastupdate" $searchDir/`
    if [ -z $updateFile ]; 
        then
            break;
    fi
    _rc=$(db_run $charhost $charport $charuser $charpass $chardb "$updateFile")
    echo "Installed update "$updateFile" with rc="$_rc
    echo
    count=$(($count+1));
done

echo "Updating CHARACTERS DB completed. Count of updates:"$count
echo "Last update CHARACTERS DB: "$dblastupdate
echo


###############################################################################
# scriptdev2
searchDir=$mangosSource"/src/bindings/ScriptDev2/sql/updates"

dtemp=$(db_config_extract $scriptConf "ScriptDev2DatabaseInfo")
read sdhost sdport sduser sdpass sddb <<<$dtemp

dbverfull=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT version FROM sd2_db_version")
echo "Full version of SCRIPT DB:" $dbverfull
count=0;

checkupdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$sddb"' AND TABLE_NAME='sd2_db_version' AND COLUMN_NAME='db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "ALTER TABLE sd2_db_version ADD COLUMN db_version smallint NOT NULL default 0 after version")
fi

length=$((${#searchDir}+2));
length1=$((${#searchDir}+6));

dblastupdate=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT db_version FROM sd2_db_version")

todb=`find $searchDir -maxdepth 1 -name "*.sql" -print |sort -n --key=$length,$length1`

for j in $todb; do
   num=`echo $j|sed -r "s/.*updates.*\/r//"|sed -r "s/_.*//"`
   if [[ $num -ge $dblastupdate ]]; then
        if [[ $j =~ .*_mangos_.* ]]; then
        _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb "$j")
        echo "Installed update "$j"  with rc="$_rc
        fi
        if [[ $j =~ .*_scriptdev2_.* ]]; then
        _rc=$(db_run $sdhost $sdport $sduser $sdpass $sddb "$j")
        echo "Installed update "$j"  with rc="$_rc
        fi
    count=$(($count+1));
    dblastupdate=$num;
    newlastupdate=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "UPDATE sd2_db_version SET db_version='$num'")
   fi
done;

echo "Last update SCRIPT DB: "$dblastupdate

echo "Updating SCRIPT DB completed. Count of updates:"$count
echo


###############################################################################
# R2
searchDir=$mangosSource"/sql_mr"

if [ ! -f $searchDir"/readme.txt" ]; then
    exit
fi

checkupdateField=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$realmdb"' AND TABLE_NAME='realmd_db_version' AND COLUMN_NAME='r2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb "ALTER TABLE realmd_db_version ADD COLUMN r2_db_version smallint NOT NULL default 0")
    _rc=$(db_run $realmhost $realmport $realmuser $realmpass $realmdb $searchDir"/custom_realmd_tables.sql")
fi

checkupdateField=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$mangosdb"' AND TABLE_NAME='db_version' AND COLUMN_NAME='r2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "ALTER TABLE db_version ADD COLUMN r2_db_version smallint NOT NULL default 0")
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $searchDir"/custom_mangos_tables.sql")
fi

checkupdateField=$(db_exec $charhost $charport $charuser $charpass $chardb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$chardb"' AND TABLE_NAME='character_db_version' AND COLUMN_NAME='r2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $charhost $charport $charuser $charpass $chardb "ALTER TABLE character_db_version ADD COLUMN r2_db_version smallint NOT NULL default 0")
    _rc=$(db_exec $charhost $charport $charuser $charpass $chardb $searchDir"/custom_characters_tables.sql")
fi

length=$((${#searchDir}+3));
length1=$((${#searchDir}+8));

todb=`find $searchDir -maxdepth 1 -name "*.sql" -print |grep "\/mr"|sort -n --key=$length,$length1`

for j in $todb; do
_num=`echo $j|sed -r "s/.*sql_mr\/mr//"|sed -r "s/_.*//"|sed -r "s/^0*//g"`

num=$(($_num));

    if [[ $j =~ .*_mangos_.* ]]; then
        dblastupdate=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT r2_db_version FROM db_version")
        if [[ $num -ge $dblastupdate ]]; then
            _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb "$j")
            echo "Installed update "$j"  with rc="$_rc
            newlastupdate=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "UPDATE db_version SET r2_db_version='$num'")
            dblastupdate=$num;
        fi
    fi
    if [[ $j =~ .*_characters_.* ]]; then
        dblastupdate=$(db_exec $charhost $charport $charuser $charpass $chardb "SELECT r2_db_version FROM character_db_version")
        if [[ $num -ge $dblastupdate ]]; then
        _rc=$(db_run $charhost $charport $charuser $charpass $chardb "$j")
            echo "Installed update "$j"  with rc="$_rc
            newlastupdate=$(db_exec $charhost $charport $charuser $charpass $chardb "UPDATE character_db_version SET r2_db_version='$num'")
            dblastupdate=$num;
        fi
    fi
    if [[ $j =~ .*_realmd_.* ]]; then
        dblastupdate=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb "SELECT r2_db_version FROM realmd_db_version")
        if [[ $num -ge $dblastupdate ]]; then
        _rc=$(db_run $realmhost $realmport $realmuser $realmpass $realmdb "$j")
            echo "Installed update "$j"  with rc="$_rc
            newlastupdate=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb "UPDATE realmd_db_version SET r2_db_version='$num'")
            dblastupdate=$num;
        fi
    fi
    count=$(($count+1));
    dblastupdate=$num;
done;

if [ $count -gt 0 ]; then
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $searchDir"/custom_rerun_every_mangos_DB_update.sql")
fi

###############################################################################
# R2 - SD2
searchDir=$mangosSource"/src/bindings/ScriptDev2/sql_mr"

if [ ! -f $searchDir"/readme.txt" ]; then
    exit;
fi

checkupdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$sddb"' AND TABLE_NAME='sd2_db_version' AND COLUMN_NAME='r2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "ALTER TABLE sd2_db_version ADD COLUMN r2_db_version smallint NOT NULL default 0 after db_version")
fi

length=$((${#searchDir}+3));
length1=$((${#searchDir}+9));

todb=`find $searchDir -maxdepth 1 -name "*.sql" -print |grep "\/mr"|sort -n --key=$length,$length1`

for j in $todb; do
_num=`echo $j|sed -r "s/.*sql_mr\/mr//"|sed -r "s/_.*//"|sed -r "s/^0*//g"`
num=$(($_num));
    if [[ $j =~ .*_mangos_.* ]]; then
        dblastupdate=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT r2_db_version FROM db_version")
        if [[ $num -ge $dblastupdate ]]; then
            _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb "$j")
            echo "Installed update "$j"  with rc="$_rc
            newlastupdate=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "UPDATE db_version SET r2_db_version='$num'")
            dblastupdate=$num;
        fi
    fi
    if [[ $j =~ .*_scriptdev2_.* ]]; then
        dblastupdate=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT r2_db_version FROM sd2_db_version")
        if [[ $num -ge $dblastupdate ]]; then
        _rc=$(db_run $charhost $sdport $sduser $sdpass $sddb "$j")
            echo "Installed update "$j"  with rc="$_rc
            newlastupdate=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "UPDATE sd2_db_version SET r2_db_version='$num'")
            dblastupdate=$num;
        fi
    fi
    count=$(($count+1));
    dblastupdate=$num;
done;
