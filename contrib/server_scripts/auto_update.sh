#!/bin/bash
###############################################################################
# configuration
home="/home/mangos"
mangosConf=$home"/etc/mangosd.conf"
scriptConf=$home"/etc/scriptdev2.conf"
mangosSource=$home"/Mangos-Sources/mangos"
YTDBSource=$home"/Mangos-Sources/ytdbase/Wotlk"
#
echo "Please, setup directories and files in begin of this script!"
exit
###############################################################################
r2searchDir=$mangosSource"/sql_mr"
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
    echo `cat $1|grep "^"$2 |sed 's/^.*=\t*//'|sed 's/\"//g' |sed 's/\<//'|sed 's/\>//'|sed 's/\;/ /g'|sed 's/\r/ /g'`
}
###############################################################################
# some extended features. don't touch, if not sure!
# dropDB : 0 - not drop before fill, 1 - drop only mangos DB, >1 - drop all DB's
dropDB=1
###############################################################################
# check all needed sources
if [ ! -f $mangosConf ]; 
        then
        echo "Cannot find config file "$mangosConf"! Please, true setup script!"
        exit;
fi
echo "Mangos config found, version "`cat $mangosConf|grep "ConfVersion"|sed 's/^.*=\t*//g'`

if [ ! -f $scriptConf ]; 
        then
        echo "Cannot find config file "$scriptConf"! Please, true setup script!"
        exit;
fi
echo "ScriptDev2 config found, version "`cat $scriptConf|grep "ConfVersion"|sed 's/^.*=\t*//g'`

# R2
if [ ! -f $mangosSource"/sql_mr/readme.txt" ]; 
    then
    echo "Cannot find R2 sources in path! Please, true setup script!"
    exit
fi

if [ ! -d $mangosSource ]; 
        then
        echo "Cannot find mangos sources in path "$mangosSource"! Please, true setup script!"
        exit;
fi
echo "Mangos sources found, R2 revision "`cat $mangosSource/src/shared/revision_R2.h|grep "define REVISION_R2"|sed 's/^.*R2//g'|sed 's/\"//g'`

if [ ! -d $YTDBSource ]; 
        then
        echo "Cannot find YTDB storage in path "$YTDBSource"! Please, true setup script!"
        exit;
fi
echo "YTDB found, revision "`svn info $YTDBSource|grep "Revision:"|sed 's/^.*\://g'`


###############################################################################
# realm
searchDir=$mangosSource"/sql/updates"
dtemp=$(db_config_extract $mangosConf "LoginDatabaseInfo")
read realmhost realmport realmuser realmpass realmdb <<<$dtemp
count=0;

###############################################################################
# check (and create if need) DB
if [ $dropDB -gt 1 ]; then
    _rc=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb 'DROP DATABASE IF EXISTS '$realmdb)
    fi;
dbcheck=$(db_exec $realmhost $realmport $realmuser $realmpass "information_schema" "SHOW DATABASES LIKE '"$realmdb"'")
if [[ $dbcheck != $realmdb ]];
    then
        echo "Realm DB $realmdb NOT found! Create and initial fill new!"
        _rc=$(db_exec $realmhost $realmport $realmuser $realmpass "information_schema" "CREATE DATABASE $realmdb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci")
        _rc=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES ON '$realmdb'.* TO '$realmuser'@')
        _rc=$(db_run $realmhost $realmport $realmuser $realmpass $realmdb $mangosSource'/sql/realmd.sql')
    else
    echo "Realm DB $realmdb found! try update to current revision."
fi

checkupdateField=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$realmdb"' AND TABLE_NAME='realmd_db_version' AND COLUMN_NAME='r2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $realmhost $realmport $realmuser $realmpass $realmdb "ALTER TABLE realmd_db_version ADD COLUMN r2_db_version smallint NOT NULL default 0")
    _rc=$(db_run $realmhost $realmport $realmuser $realmpass $realmdb $r2searchDir"/custom_realmd_tables.sql")
fi

###############################################################################
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
# check (and create if need) DB

if [ $dropDB -ge 1 ]; then
    _rc=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb 'DROP DATABASE IF EXISTS '$mangosdb)
    fi;
dbcheck=$(db_exec $mangoshost $mangosport $mangosuser $mangospass "information_schema" "SHOW DATABASES LIKE '"$mangosdb"'")
if [[ $dbcheck != $mangosdb ]];
    then
        echo "Mangos world DB $mangosdb NOT found! Try create and initial fill new!"
        check7z=`locate bin/7za`
        if [ -z "$check7z" ]; 
        then
            echo "P7zip not installed! Install p7zip and try again, or manually fill mangos DB!"
            exit;
        fi
        _rc=$(db_exec $mangoshost $mangosport $mangosuser $mangospass "information_schema" "CREATE DATABASE $mangosdb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci")
        _rc=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES ON '$mangosdb'.* TO '$mangosuser'@')
        _rc=$(db_run  $mangoshost $mangosport $mangosuser $mangospass $mangosdb $mangosSource"/sql/mangos.sql")
        _rc=$(db_run  $mangoshost $mangosport $mangosuser $mangospass $mangosdb $mangosSource"/sql/mangos_indexes.sql")
        ytdbL=`ls $YTDBSource |sort -r|head -n 1`
        echo $ytdbL
        ytdbLast=`find "$YTDBSource/$ytdbL" -maxdepth 1 -name *.7z`
        7za e -o/tmp $ytdbLast
        ytdbLastsql=`find /tmp -maxdepth 1 -name *$ytdbL*.sql`
        echo "Install database "$ytdbLastsql
        _rc=$(db_run  $mangoshost $mangosport $mangosuser $mangospass $mangosdb $ytdbLastsql)
        rm $ytdbLastsql
    else
    echo "Mangos world DB $mangosdb found! try update to current revision."
fi

checkupdateField=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$mangosdb"' AND TABLE_NAME='db_version' AND COLUMN_NAME='r2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "ALTER TABLE db_version ADD COLUMN r2_db_version smallint NOT NULL default 0")
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $r2searchDir"/custom_mangos_tables.sql")
fi
###############################################################################
searchDir=$mangosSource"/sql/updates"

dbverfull=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT version FROM db_version")
echo "Full version of MANGOS DB:" $dbverfull
count=0;

# begin masquerade tables before apply YTDB updates (for structure compartibility)
if [ -f $r2searchDir"/custom_mangos_masquerade_begin.sql" ]; then
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $r2searchDir"/custom_mangos_masquerade_begin.sql")
fi;

while [ ! -z $mangosdb ]
do
    dblastupdate=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$mangosdb"' AND TABLE_NAME='db_version_ytdb' AND DATA_TYPE='bit'")

    YTDBlastVer=`echo $dblastupdate|cut -c 1,2,3`
    YTDBnewVer=$(($YTDBlastVer+1));
    echo "Searching update version: "$YTDBnewVer

    updatepackName="mangos_FIX";
    if [ $YTDBnewVer -ge 630 ]; 
        then
        updatepackName="updatepack_mangos";
    fi;

    YTDBDir=`echo $YTDBlastVer|cut -c 1,2`
    ytdbsearchDir=$YTDBSource"/R"$YTDBDir"/Updates/"
    if [ ! -d "$ytdbsearchDir" ]; 
        then
            break;
    fi;

    updateFile=`find "$ytdbsearchDir" -maxdepth 1 -name "$YTDBnewVer"_"$updatepackName"*.sql  |sort -n`
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

# finish masquerade tables after apply YTDB updates 
if [ -f $r2searchDir"/custom_mangos_masquerade_end.sql" ]; then
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $r2searchDir"/custom_mangos_masquerade_end.sql")
fi;

if [ $count -gt 0 ]; then
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $r2searchDir"/custom_rerun_every_mangos_DB_update.sql")
    echo "Updating YTDB completed. Count of updates:"$count
    fi;

dbverfull=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT version FROM db_version")
echo "Last update YTDB: "$dblastupdate" Full YTDB version: "$dbverfull

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

if [ $count -gt 0 ]; then
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $r2searchDir"/custom_rerun_every_mangos_DB_update.sql")
fi

if [ $count -gt 0 ]; then
    echo "Updating MANGOS DB completed. Count of updates:"$count
    fi;

echo "Last update MANGOS DB: "$dblastupdate
echo
###############################################################################
# characters
dtemp=$(db_config_extract $mangosConf "CharacterDatabaseInfo")
read charhost charport charuser charpass chardb <<<$dtemp
count=0;

###############################################################################
# check (and create if need) DB
if [ $dropDB -gt 1 ]; then
    _rc=$(db_exec $charhost $charport $charuser $charpass $chardb 'DROP DATABASE IF EXISTS '$chardb)
    fi;

dbcheck=$(db_exec $charhost $charport $charuser $charpass "information_schema" "SHOW DATABASES LIKE '"$chardb"'")
if [[ $dbcheck != $chardb ]];
    then
        echo "Mangos characters DB $chardb NOT found! Create and initial fill new!"
        _rc=$(db_exec $charhost $charport $charuser $charpass "information_schema" "CREATE DATABASE $chardb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci")
        _rc=$(db_exec $charhost $charport $charuser $charpass $chardb 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES ON '$mangosdb'.* TO '$charuser'@')
        _rc=$(db_run  $charhost $charport $charuser $charpass $chardb $mangosSource"/sql/characters.sql")
    else
    echo "Mangos characters DB $chardb found! try update to current revision."
fi

checkupdateField=$(db_exec $charhost $charport $charuser $charpass $chardb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$chardb"' AND TABLE_NAME='character_db_version' AND COLUMN_NAME='r2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $charhost $charport $charuser $charpass $chardb "ALTER TABLE character_db_version ADD COLUMN r2_db_version smallint NOT NULL default 0")
    _rc=$(db_run $charhost $charport $charuser $charpass $chardb $r2searchDir"/custom_characters_tables.sql")
fi
###############################################################################
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

if [ $dropDB -gt 1 ]; then
    _rc=$(db_exec $sdhost $sdport $sduser $sdpass $sddb 'DROP DATABASE IF EXISTS '$sddb)
    fi;
###############################################################################
# check (and create if need) DB

dbcheck=$(db_exec $sdhost $sdport $sduser $sdpass "information_schema" "SHOW DATABASES LIKE '"$sddb"'")
if [[ $dbcheck != $sddb ]];
    then
        echo "SD2 DB $sddb NOT found! Create and initial fill new!"
        _rc=$(db_exec $sdhost $sdport $sduser $sdpass "information_schema" "CREATE DATABASE $sddb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci")
        _rc=$(db_exec $sdhost $sdport $sduser $sdpass $sddb 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES ON '$sddb'.* TO '$sduser'@')
        _rc=$(db_run  $sdhost $sdport $sduser $sdpass $sddb $mangosSource"/src/bindings/ScriptDev2/sql/scriptdev2_create_structure_mysql.sql")
        _rc=$(db_run  $sdhost $sdport $sduser $sdpass $sddb $mangosSource"/src/bindings/ScriptDev2/sql/scriptdev2_script_full.sql")
        _rc=$(db_run  $sdhost $sdport $sduser $sdpass $sddb $mangosSource"/src/bindings/ScriptDev2/sql_mr/custom_scriptdev2_bsw_table.sql")
        echo "Pre-fill scriptnames in Mangos World DB"; 
        _rc=$(db_run  $mangoshost $mangosport $mangosuser $mangospass $mangosdb $mangosSource"/src/bindings/ScriptDev2/sql/mangos_scriptname_full.sql")
    else
    echo "SD2 DB $sddb found! try update to current revision."
fi

checkupdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$sddb"' AND TABLE_NAME='sd2_db_version' AND COLUMN_NAME='db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "ALTER TABLE sd2_db_version ADD COLUMN db_version smallint NOT NULL default 0 after version")
    checkUpdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "UPDATE sd2_db_version SET db_version=0")
fi

checkupdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$sddb"' AND TABLE_NAME='sd2_db_version' AND COLUMN_NAME='r2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "ALTER TABLE sd2_db_version ADD COLUMN r2_db_version smallint NOT NULL default 0 after db_version")
    checkUpdateField=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "UPDATE sd2_db_version SET r2_db_version=0")
    customupdateFile=$searchDir"/custom_scriptdev2_stuff.sql"
    if [ -f $customupdateFile ]; then
        _rc=$(db_run $sdhost $sdport $sduser $sdpass $sddb $cusomupdateFile)
    fi;
fi

checkupdateField=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='"$mangosdb"' AND TABLE_NAME='db_version' AND COLUMN_NAME='r2_sd2_db_version'")
if [[ $checkupdateField == "" ]]; then
    checkUpdateField=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "ALTER TABLE db_version ADD COLUMN r2_sd2_db_version smallint NOT NULL default 0")
    checkUpdateField=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "UPDATE db_version SET r2_sd2_db_version=0")
    customupdateFile=$r2searchDir"/custom_scriptdev2_stuff.sql"
    if [ -f $customupdateFile ]; then
        _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $customupdateFile)
    fi;
fi

###############################################################################
dbverfull=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT version FROM sd2_db_version")
dblastupdate=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT db_version FROM sd2_db_version")

echo "Full version of SCRIPT DB:" $dbverfull" last update: "$dblastupdate
count=0;

length=$((${#searchDir}+2));
length1=$((${#searchDir}+6));

todb=`find $searchDir -maxdepth 1 -name "*.sql" -print |sort -n --key=$length,$length1`

for j in $todb; do
   num=`echo $j|sed -r "s/.*updates.*\/r//"|sed -r "s/_.*//"`
   if [ $num -ge $dblastupdate ]; then
        if [[ $j =~ .*_mangos.* ]]; then
            _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb "$j")
            echo "Installed update "$j"  with rc="$_rc
        fi
        if [[ $j =~ .*_scriptdev2.* ]]; then
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

###############################################################################
# R2 update

length=$((${#r2searchDir}+3));
length1=$((${#r2searchDir}+8));

todb=`find $r2searchDir -maxdepth 1 -name "*.sql" -print |grep "\/mr"|sort -n --key=$length,$length1`

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
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb $r2searchDir"/custom_rerun_every_mangos_DB_update.sql")
fi

###############################################################################
# R2 - SD2
searchDir=$mangosSource"/src/bindings/ScriptDev2/sql_mr"

if [ ! -f $searchDir"/readme.txt" ]; then
    exit;
fi

length=$((${#searchDir}+3));
length1=$((${#searchDir}+9));

todb=`find $searchDir -maxdepth 1 -name "*.sql" -print |grep "\/mr"|sort -n --key=$length,$length1`

for j in $todb; do
_num=`echo $j|sed -r "s/.*sql_mr\/mr//"|sed -r "s/_.*//"|sed -r "s/^0*//g"`
num=$(($_num));
    if [[ $j =~ .*_mangos_.* ]]; then
        dblastupdatemangos=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "SELECT r2_sd2_db_version FROM db_version")
        if [[ $num -ge $dblastupdatemangos ]]; then
            _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb "$j")
            echo "Installed update "$j"  with rc="$_rc
            newlastupdate=$(db_exec $mangoshost $mangosport $mangosuser $mangospass $mangosdb "UPDATE db_version SET r2_sd2_db_version='$num'")
            dblastupdatemangos=$num;
        fi
    fi
    if [[ $j =~ .*_scriptdev2_.* ]]; then
        dblastupdatesd2=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "SELECT r2_db_version FROM sd2_db_version")
        if [[ $num -ge $dblastupdatesd2 ]]; then
            _rc=$(db_run $charhost $sdport $sduser $sdpass $sddb "$j")
            echo "Installed update "$j"  with rc="$_rc
            newlastupdate=$(db_exec $sdhost $sdport $sduser $sdpass $sddb "UPDATE sd2_db_version SET r2_db_version='$num'")
            dblastupdatesd2=$num;
        fi
    fi
    count=$(($count+1));
done;

if [ $count -gt 0 ]; then
    _rc=$(db_run $mangoshost $mangosport $mangosuser $mangospass $mangosdb  $searchDir"/last_mangos_sql_at_every_db_update.sql")
fi
