#!/usr/bin/sh
# $1 - комманда $2 - SID $3 - DB (121|)
sid=$2;db=$3
export ORACLE_SID=$2
export ORACLE_HOME=/oracle/$sid/$db
export ORACLE_SID=$sid
export PATH=/usr/bin:/usr/sbin/:$ORACLE_HOME/bin
export nls_lang=american_cis.cl8mswin1251
case $1 in
'process')
sql="set pagesize 0
set numwidth 18;
select count(*) from v\$process;"
	;;
'session')
sql="set pagesize 0
set numwidth 18;
select count(*) from v\$session;"
	;;
esac
echo "$sql" | sqlplus -s /nolog @/opt/zabbix/cont.sql | awk '{print $1}'
