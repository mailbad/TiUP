create_docker_network () {
docker network create -d bridge zert
}


wordpress () {
docker run --net zert -idt --dns 10.21.1.205 --restart=always --cpuset-cpus=0-23 -m 2G --name test -h test -v /data/BFSU/test_run:/var/www/html/wp-content -e WORDPRESS_DB_USER=test_word -e WORDPRESS_DB_PASSWORD=test_word -e WORDPRESS_DB_NAME=test_word -e WORDPRESS_DB_HOST=172.17.0.1 -p 80:80 wordpress
#docker run -idt --restart=always --name test1 -h test1 -v /data/BFSU/test_run:/var/www/html/wp-content -e WORDPRESS_DB_USER=test_word -e WORDPRESS_DB_PASSWORD=test_word -e WORDPRESS_DB_NAME=test_word -e WORDPRESS_DB_HOST=172.17.0.1 wordpress

}


memcached () {
docker run -itd --restart=always  --net zert --dns 10.21.1.205 --name memcached -h memcached -v /data/docker_run/memcached:/tiup tiup:memcached
}

memcached-demo () {
docker run -itd --restart=always  --net zert --dns 10.21.1.205 --name memcached-demo -h memcached-demo -v /data/docker_run/memcached-demo:/tiup tiup:memcached
}

redis () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name redis -h redis -v /data/docker_run/redis:/tiup tiup:redis
}

dlogcenter () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name dlogcenter -h dlogcenter -v /data/docker_run/ice/dlogcenter:/tiup tiup:ice34
}
dbproxy () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name dbproxy -h dbproxy -v /data/docker_run/ice/dbproxy:/tiup tiup:ice34
}
idserver () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name idserver -h idserver -v /data/docker_run/ice/idserver:/tiup tiup:ice34
}
store () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name store -h store -v /data/docker_run/ice/store:/tiup tiup:ice34
}
tagsearch () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name tagsearch -h tagsearch -v /data/docker_run/ice/tagsearch:/tiup tiup:ice34
}
usersearch () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name usersearch -h usersearch -v /data/docker_run/ice/usersearch:/tiup tiup:ice34
}

uc_auth() {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --add-host uc.demo.tiup.ren:172.18.0.1  --add-host demo.tiup.ren:172.18.0.1 --name ucauth -h ucauth -v /data/docker_run/golang/uc/auth:/tiup tiup:gorun
}

uc_sso () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --add-host uc.demo.tiup.ren:172.18.0.1 --name ucsso -h ucsso -v /data/docker_run/golang/uc/sso:/tiup tiup:gorun
}

uc_ucprovider () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name ucprovider -h ucprovider -v /data/docker_run/golang/uc/ucprovider:/tiup tiup:gorun
}

start_nginx () {
#docker run -itd --net zert --name nginx -h nginx -v /data/docker_run/nginx:/tiup -p 80:80 -p 443:443 tiup:nginx
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name nginx -h nginx -v /data/docker_run/nginx:/tiup -p 80:80 -p 443:443 tiup:nginx
}

start_julydc () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name julydc -h julydc -v /data/docker_run/golang/datacenter-july:/tiup tiup:gorun
}

test_start_julydc () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name julydc-zyj -h julydc-zyj -v /data/docker_run/golang/datacenter-july-zyj:/tiup tiup:gorun
}

test_zyj_start_julydc () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name julydc-test -h julydc-test -v /data/docker_run/golang/datacenter-july-zyj-test:/tiup -p 2210:22 -p 8081:8081 tiup:gorun


}

start_rabbitmq () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name rabbitmq -h rabbitmq -v /data/docker_run/rabbitmq:/tiup tiup:rabbitmq  
}

#/data/docker_run/educenter
#account-service  data-access  file-storage  import-service
start_educenter-account () {

docker run -idt --restart=always --net zert --dns 10.21.1.205 --name edu-account -h edu-account -v /data/docker_run/educenter/account-service:/tiup tiup:gorun
docker run -idt --restart=always --net zert --dns 10.21.1.205 --name edu-data -h edu-data -v /data/docker_run/educenter/data-access:/tiup tiup:gorun
docker run -idt --restart=always --net zert --dns 10.21.1.205 --name edu-storage -h edu-strage -v /data/docker_run/educenter/file-storage:/tiup tiup:gorun
docker run -idt --restart=always --net zert --dns 10.21.1.205 --name edu-import -h edu-import -v /data/docker_run/educenter/import-service:/tiup tiup:gorun

}

start_pic-img () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name pic-img -h pic-img -v /data/docker_run/tiup_file/pic-img:/tiup tiup:nginx-php
}

start_static () {
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name static -h static -v /data/docker_run/tiup_file/static:/tiup tiup:nginx-php 
}

start_imserver () {
#docker run -itd --net zert --name imserver -h imserver -v /data/docker_run/pomelo:/tiup -p 3010:3010 -p 3051:3051 tiup:imserver
#docker run -itd --net zert --name imserver -h imserver -v /data/docker_run/pomelo:/tiup tiup:imserver
docker run -itd --restart=always --net zert --dns 10.21.1.205 --add-host demo.tiup.ren 172.18.0.1 --add-host imserver.demo.tiup.ren:127.0.0.1 --name imserver -h imserver -v /data/docker_run/pomelo:/tiup -p 3010:3010  -p 3051:3051 tiup:imserver

docker run -itd --restart=always --net zert --dns 10.21.1.205 --add-host demo.tiup.ren:172.18.0.1 --add-host imserver.demo.tiup.ren:127.0.0.1 --name imserver-http -h imserver-http -v /data/docker_run/pomelo-http:/tiup -p 3020:3020  -p 3061:3061 tiup:imserver

docker run -itd --restart=always --net zert --dns 10.21.1.205 --add-host xkimserverupdate.demo.tiup.ren:172.18.0.1 --add-host xk-imserver.demo.tiup.ren:127.0.0.1 --name xk-imserver -h xk-imserver -v /data/docker_run/xk-pomelo:/tiup -p 2132:22 -p 3011:3011  -p 3052:3052 tiup:imserver
}

start_topdf () {
docker run -idt --restart=always --net zert --dns 10.21.1.205 -h topdf --name topdf -v /data/docker_run/tiup_file/topdf:/tiup tiup:topdf
}

start_rsync () {

#docker run -itd --net zert --name backup -h backup -v /data/tiup_backup/backup:/tiup -p 10.21.5.88:873:873 tiup:rsync
#docker run -itd --net zert --name backup -h backup -v /data/tiup_backup/backup:/tiup -p 873:873 tiup:rsync
docker run -itd --restart=always --net zert --dns 10.21.1.205 --name backup -h backup -v /data/tiup_backup/backup:/tiup -p 873:873 tiup:rsync

}

start_edu-mp4 () {

docker run -idt --net zert --dns 10.21.1.205 --restart=always --name edu-mp4 -h edu-mp4 -v /data/docker_run/tiup_file/edu_mp4:/tiup tiup:edu-mp4

}

start_adapters () {

docker run -idt --net zert --dns 10.21.1.205 --restart=always --name adapters -h adapters -v /data/docker_run/golang/adapters:/tiup tiup:gorun

}

start_rpacl () {

docker run -idt --net zert --dns 10.21.1.205 --restart=always --name rpacl -h rpacl -v /data/docker_run/golang/rpacl:/tiup tiup:gorun

}

start_tcs () {

docker run -idt --net zert --dns 10.21.1.205 --restart=always --name tcs -h tcs -v /data/docker_run/golang/tcs:/tiup tiup:gorun

}

start_static_js () {

docker run -idt --net zert --dns 10.21.1.205 --restart=always --name staticjs -h staticjs -v /data/docker_run/tiup_file/static_js:/tiup -p 2022:22 tiup:nginx
#docker run -idt --net zert --name staticjs -h staticjs -v /data/docker_run/tiup_file/static_js:/tiup -p 10.21.5.88:2022:22 tiup:nginx

}

start_docker-reg () {
 docker run -idt --restart=always --dns 10.21.1.205 --net zert --name docker-reg -h docker-reg -v /data/docker_run/docker/registry:/var/lib/registry tiup:distribution
}


redis_modify () {


/tiup/www/core/ThinkPHP/Extend/Driver/Cache/CacheRedis.class.php

}

#时区调整
time_check () {
for i in `docker ps |awk '{print $1}'|sed 1d`; do docker exec -it $i cp -arf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime ; done  
}
