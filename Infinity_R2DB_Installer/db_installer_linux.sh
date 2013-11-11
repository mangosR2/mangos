# Mangos
mysql -u root --password=123456 -h 127.0.0.1 --port=3310 < "./Development/create_mysql.sql"

cd ./Development/mangos
find . -name '*.sql' | sort -n  | awk '{ print "source",$0 }' | mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos 

cd ../mangosR2
find . -name '*.sql' | sort -n  | awk '{ print "source",$0 }' | mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos

cd ../mangosR2sd2
find . -name '*.sql' | sort -n  | awk '{ print "source",$0 }' | mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos

cd ../Infinity_DB_Updates
find . -name '*.sql' | sort -n  | awk '{ print "source",$0 }' | mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos

cd ../Run_Last/
find . -name '*.sql' | sort -n  | awk '{ print "source",$0 }' | mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos

# ScriptDev2
cd ../scriptdev2/
find . -name '*.sql' | sort -n  | awk '{ print "source",$0 }' | mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=scriptdev2

# realmd
cd ../realmd/
find . -name '*.sql' | sort -n  | awk '{ print "source",$0 }' | mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=realmd

# characters
cd ../characters/
find . -name '*.sql' | sort -n  | awk '{ print "source",$0 }' | mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=characters
