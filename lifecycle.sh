#!/bin/bash
#~zach
DIR=/mysql

if [ -d $DIR ]; then
    # bindfs -u root -g root --create-for-user=mysql --create-for-group=mysql /mysql/ /var/lib/mysql/

    # chown -R mysql:mysql $DIR
    # chmod 750 $DIR
    rm -rf /var/lib/mysql
    ln -s $DIR /var/lib/mysql

    mysqld
fi
