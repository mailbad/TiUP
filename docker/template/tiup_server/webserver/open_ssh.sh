#!/usr/bin/env bash
[ ! -f /tiup/conf/supervisor.d/sshd.ini.bak ] && {
	echo ssh is open!
	exit 0
	}
echo "root:tiupadmin" |chpasswd
mv /tiup/conf/supervisor.d/sshd.ini.bak /tiup/conf/supervisor.d/sshd.ini
echo "UseDNS no" >> /etc/ssh/sshd_config
supervisorctl reload
