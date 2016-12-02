#!/usr/bin/env bash

dc () {
	for i in `find /tiup/www/apps/ -type d -name Runtime`; do find $i -type f -name "*.php"; done|xargs rm -rf 
}
he () {
	sed -i 's/'"'${HOSTNAME}_"'/'"'http_${HOSTNAME}_"'/g' /tiup/www/core/ThinkPHP/Conf/memcache_conf.php 
	sed -i "s/'https'/'http'/g" /tiup/www/apps/conf.php
	sed -i "s/define('IM_PORT',3010);/define('IM_PORT',3020);/g" /tiup/www/apps/conf.php
	sed -i "s/define('IM_HTTPS', \"true\");/define('IM_HTTPS', \"false\");/g" /tiup/www/apps/conf.php
	dc
}
hd () {
	sed -i 's/'"'http_${HOSTNAME}_"'/'"'${HOSTNAME}_"'/g' /tiup/www/core/ThinkPHP/Conf/memcache_conf.php 
	sed -i "s/'http'/'https'/g" /tiup/www/apps/conf.php
	sed -i "s/define('IM_PORT',3020);/define('IM_PORT',3010);/g" /tiup/www/apps/conf.php
	sed -i "s/define('IM_HTTPS', \"false\");/define('IM_HTTPS', \"true\");/g" /tiup/www/apps/conf.php
	dc
}
st () {
	grep PIC_HTTPTYPE /tiup/www/apps/conf.php|grep '^d'|cut -d\' -f4
}

echo he hd st
${1}
