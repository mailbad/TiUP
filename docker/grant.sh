#!/usr/bin/bash

[ -z $1 ] && exit
[ -z $2 ] && exit
[ -z $3 ] && exit
[ -z $4 ] && exit

user=$1
ip=$2
pass=$3
database=$4

MYSQL_COM () {
	mysql -uroot -plgptiupadmin -s -e "$1"
}

MYSQL_COM "create database $database;"

MYSQL_COM "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'$ip' IDENTIFIED BY '$pass' WITH GRANT OPTION;"
MYSQL_COM "FLUSH   PRIVILEGES;"
