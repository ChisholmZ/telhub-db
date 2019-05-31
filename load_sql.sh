#!/bin/bash
# load sql
#~zach

if [ "$1" == "backup" ]; then
    mysqldump -p${MYSQL_PASSWORD} --lock-tables=false --all-databases > /root/sql/dump.sql
elif [ "$1" == "restore" ] && [ -f /root/sql/dump.sql ]; then
    mysql -p${MYSQL_PASSWORD} < /root/sql/dump.sql
elif [ "$1" == "add" ]; then
    DATABASES=$(env | grep DATABASE | sed 's/[^=]*=//')
    if [ "$DATABASES" ]; then
        for DATABASE in $DATABASES; do
            mysql -p${MYSQL_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DATABASE} ; GRANT ALL ON ${DATABASE}.* TO '${MYSQL_USER}'@'%' ; FLUSH PRIVILEGES ;"
        done
    fi
elif [ ! -z "$1" ] && [ ! -z "$2" ] && [ -f /root/sql/$1.sql ]; then
    mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} $2 < /root/sql/$1.sql
fi
