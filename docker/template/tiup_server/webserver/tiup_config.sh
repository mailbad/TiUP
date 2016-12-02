#!/usr/bin/env bash

cp -arf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
ln -s /usr/bin/php /usr/bin/php2
mkdir /tiup/www/apps/home/htdocs/data/privacy -p
chown apache.apache /tiup/www/apps/home/htdocs/data/privacy

#disable file type
#mkdir /tiup/file
#chown apache.apache /tiup/file

mkdir /tiup/file/privacy/photo -p
chown apache.apache /tiup/file/privacy/photo
mkdir /tiup/www/static/sample/servcenter  -p
chown -R apache.apache /tiup/www/static/sample/servcenter
mkdir /tiup/www/static/sample/campus -p
chown -R apache.apache /tiup/www/static/sample/campus

mkdir /tiup/run/php-fpm/session -p
chown -R apache.apache /tiup/run/php-fpm/session


[ -f /var/spool/cron/root ] || {
	echo '* * * * *  cd /tiup/www/tools/task; php minute_sche.php >> minute_sche.log' >> /var/spool/cron/root
	echo '* * * * *  cd /tiup/www/tools/task; php minute_sche2.php >> minute_sche2.log' >> /var/spool/cron/root
}

#update redis local
sed -i 's/127.0.0.1/redis/g' /tiup/www/core/ThinkPHP/Extend/Driver/Cache/CacheRedis.class.php
#update static no tiup.cn
#sed -i 's/static.tiup.cn/static.demo.tiup.ren/g' /tiup/www/core/ThinkPHP/Extend/Service/FrontEndService.class.php
sed -i 's/static.tiup.cn/staticjs.demo.tiup.ren/g' /tiup/www/core/ThinkPHP/Extend/Service/FrontEndService.class.php

#update common
sed -i '/vdiskconf.php/d' /tiup/www/apps/common.php
#sed -i 's/TIUP_STORE_PATH.\"\/privacy\/photo\/\"/ROOT_DIR \. \"\/apps\/home\/htdocs\/data\/privacy\/photo\/"/g' /tiup/www/apps/common.php
#sed -i 's/\"PRI_PHOTOIMAGE_HTTP\" , \"\/privacy\/photo\/\"/\"PRI_PHOTOIMAGE_HTTP\" , \"\/data\/privacy\/photo\/\"/g'  /tiup/www/apps/common.php

#static https            proxy_set_header X-Forwarded-Proto https;
#/core/ThinkPHP/Extend/Service/FrontEndService.class.php
