#!/usr/bin/env bash
chsh -s /bin/bash nobody
echo "nobody:tiupadmin" |chpasswd
mv /tiup/conf/supervisor.d/sshd.ini.bak /tiup/conf/supervisor.d/sshd.ini
echo "UseDNS no" >> /etc/ssh/sshd_config
supervisorctl reload
