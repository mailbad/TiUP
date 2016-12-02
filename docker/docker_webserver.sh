#!/usr/bin/env bash

webserver_help () {
	echo "$0 add | addssh | del | ssh | reload | reloadssh | httpe | httpd | httpt && user fz \ status"
	exit 0
}
if [ "$1" == "status" ];then
	:
else
[ -z $1 ] && webserver_help
[ -z $2 ] && exit
[ -z $3 ] && exit
fi


user=$2
user_fz=$3
docker_tp=/data/docker_template/tiup_server/webserver
docker_user_dir=/data/docker_run/user

user_dir=${docker_user_dir}/${user}
tiup_git=${docker_user_dir}/TiUP
tiup_user=48
nginx_tp=/data/docker_template/nginx/conf/nginx/conf.d
nginx_run=/data/docker_run/nginx/conf/nginx/conf.d
nginx_log=/data/docker_run/nginx/logs/nginx
nginx_ssl=/data/docker_run/nginx/root-key
nginx_docker_name=nginx


if [ "${user}" == "demo" ];then
	#user_fz=master
	#docker_name=$(echo ${user}|sed 's/_//g'|sed 's/-//g'|sed 's/\.//g')
	docker_name=$(echo ${user}|sed -e 's/_//g' -e 's/-//g' -e 's/\.//g')
	fz_name=""
	user_fz_dir=${user_dir}
elif [ "${user}" == "zert" ];then
	fz_name="${4}"
	#docker_name=$(echo ${user}${fz_name}|sed 's/_//g'|sed 's/-//g'|sed 's/\.//g')
	docker_name=$(echo ${user}${fz_name}|sed -e 's/_//g' -e 's/-//g' -e 's/\.//g')
	user_fz_dir=${user_dir}/${fz_name}
else
	fz_name="${user_fz}"
	#docker_name=$(echo ${user}${user_fz}|sed 's/_//g'|sed 's/-//g'|sed 's/\.//g')
	docker_name=$(echo ${user}${user_fz}|sed -e 's/_//g' -e 's/-//g' -e 's/\.//g')
	user_fz_dir=${user_dir}/${fz_name}
fi

docker_ssh_port="22"
docker_run_common="docker exec -it ${docker_name} "

while [ $(ss -nlt|awk '{print $4}'|sed 1d|sed 's/::://g'|cut -d':' -f2|grep "^${docker_ssh_port}$"|wc -l) -ne 0 ];do
	docker_ssh_port="${RANDOM}"
done

ssl_key_add () {
ssl_user_key=/data/docker_run/nginx/ssl-key/user_key
ssl_nginx_key=/data/docker_run/nginx/conf/nginx
[ "$1" == "add" ] && {
	docker exec -it nginx /tiup/ssl-key/ssl-key.sh ${docker_name}.demo.tiup.ren
	cp -arf ${ssl_user_key}/${docker_name}.demo.tiup.ren.crt ${ssl_user_key}/${docker_name}.demo.tiup.ren.key ${ssl_nginx_key}
	}
[ "$1" == "del" ] && {
	rm -rf ${ssl_nginx_key}/${docker_name}.demo.tiup.ren*
	}
[ "$1" == "adddemo" ] && {
	docker exec -it nginx /tiup/ssl-key/ssl-key.sh demo.tiup.ren
	cp -arf ${ssl_user_key}/demo.tiup.ren.crt ${ssl_user_key}/demo.tiup.ren.key ${ssl_nginx_key}
	}
[ "$1" == "deldemo" ] && {
	rm -rf ${ssl_nginx_key}/demo.tiup.ren*
	}

}

echo_ssl_html () {
domain_name=demo.tiup.ren
if [ "$1" == "add" ];then
	echo '<div style="text-align: center; font-size: 50px;">' >> ${nginx_ssl}/${docker_name}.html
#	echo '<div style="text-align: center; font-size: 50px;">'
	[ "${docker_name}" == "demo" ] && {
#		ssl_url_name="404 open api static staticjs upload edu-mp4 pic-img tcs "
		ssl_url_name="404 static staticjs upload edu-mp4 pic-img"
	} || {
#		ssl_url_name="404 open api static staticjs upload edu-mp4 pic-img tcs  static.${docker_name} upload.${docker_name}"
		ssl_url_name="404 static staticjs upload edu-mp4 pic-img static.${docker_name} upload.${docker_name}"
	}

	#for i in 404 open api static staticjs upload edu-mp4 pic-img tcs  static.${docker_name} upload.${docker_name}
	for i in $(echo -en "${ssl_url_name}")
		do
		echo '<div style="margin-bottom:50px;"><a target="_blank" rel="nofollow" href="'https://$i.${domain_name}'" >'${i}'</a></div>' >> ${nginx_ssl}/${docker_name}.html
		#echo '<div style="margin-bottom:50px;"><a target="_blank" rel="nofollow" href="'https://$i.${domain_name}'" >'${i}'</a></div>' 
	done
else
	rm -rf ${nginx_ssl}/${docker_name}.html
fi

}

add () {

[ -d ${user_fz_dir} ] || {
	if [ "${user}" == "demo" ];then
	:
	else
	[ -d ${user_dir} ] || mkdir -p ${user_dir}
	fi
	cp -arf ${docker_tp} ${user_fz_dir} || exit

	#cd ${tiup_git};git checkout ${user_fz};git pull || exit
	cd ${tiup_git};git checkout -f;git pull;git checkout ${user_fz};git pull || exit

	cp -arf ${tiup_git}/src/* ${user_fz_dir}/www/
	
	for i in conf/nginx/conf.d/1_static.conf  tiup_config/apps/conf.php
	do
 	if [ "${user}" == "demo" ];then
       	sed -i "s/rename.demo/demo/g" ${user_fz_dir}/${i}
	else
       	sed -i "s/rename.demo/${docker_name}.demo/g" ${user_fz_dir}/${i}
	fi
	done
	sed -i "s/tiup.cn/${docker_name}.demo.tiup.ren/g" ${user_fz_dir}/tiup_config/core/Educenter/Core/config.ini
	#修改memcache前缀
	sed -i "s/global_/${docker_name}_/g" ${user_fz_dir}/tiup_config/core/ThinkPHP/Conf/memcache_conf.php
	cp -arf ${user_fz_dir}/tiup_config/* ${user_fz_dir}/www/
	chown -R ${tiup_user}.${tiup_user} ${user_fz_dir}/www/
	#docker run -idt --restart=always --net zert --name $docker_name -h $docker_name -p ${docker_ssh_port}:22 -v ${user_fz_dir}:/tiup tiup:webserver
	#docker run -idt --restart=always --net zert --name $docker_name -h $docker_name -p 10.21.5.88:${docker_ssh_port}:22 -v ${user_fz_dir}:/tiup tiup:webserver
	#docker run -idt --restart=always --net zert --add-host uc.demo.tiup.ren:172.18.0.1 --name $docker_name -h $docker_name -p 10.21.5.88:${docker_ssh_port}:22 -v ${user_fz_dir}:/tiup tiup:webserver

	#docker run -idt --restart=always --net zert --dns 10.21.1.205 --add-host uc.demo.tiup.ren:172.18.0.1 --name $docker_name -h $docker_name -p ${docker_ssh_port}:22 -v ${user_fz_dir}:/tiup tiup:webserver
	docker run -idt --restart=always --net zert --dns 10.21.1.205 --add-host uc.demo.tiup.ren:172.18.0.1 --name $docker_name -h $docker_name -p ${docker_ssh_port}:22 -v ${user_fz_dir}:/tiup docker-reg.tiup.ren/webserver:1.0
 	if [ "${user}" == "demo" ];then
	cp -arf ${nginx_tp}/demo.conf ${nginx_run}/demo.conf
	cp -arf ${nginx_tp}/static.conf ${nginx_run}/static.conf
	cp -arf ${nginx_tp}/upload.conf ${nginx_run}/upload.conf 
	cp -arf ${nginx_tp}/open.conf ${nginx_run}/open.conf
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/demo.conf
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/static.conf
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/upload.conf
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/open.conf
	#ssl_key_add adddemo
	else
	cp -arf ${nginx_tp}/rename.demo.conf ${nginx_run}/${docker_name}.demo.conf
	cp -arf ${nginx_tp}/rename.static.conf ${nginx_run}/${docker_name}.static.conf
	cp -arf ${nginx_tp}/rename.upload.conf ${nginx_run}/${docker_name}.upload.conf 
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/${docker_name}.demo.conf
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/${docker_name}.static.conf
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/${docker_name}.upload.conf
	ssl_key_add add
	cp -arf ${nginx_tp}/rename.demo-ssl.conf ${nginx_run}/${docker_name}.demo-ssl.conf
	cp -arf ${nginx_tp}/rename.static-ssl.conf ${nginx_run}/${docker_name}.static-ssl.conf
	cp -arf ${nginx_tp}/rename.upload-ssl.conf ${nginx_run}/${docker_name}.upload-ssl.conf 
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/${docker_name}.demo-ssl.conf
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/${docker_name}.static-ssl.conf
	sed -i "s/rename/${docker_name}/g" ${nginx_run}/${docker_name}.upload-ssl.conf
	fi
	echo_ssl_html add
	docker exec -it ${docker_name} sh /tiup/tiup_config.sh
	#docker exec -it ${nginx_docker_name} supervisorctl restart nginx
        docker exec -it ${nginx_docker_name} /usr/sbin/nginx -c /tiup/conf/nginx/nginx.conf -s reload
	echo ${docker_name}.demo.tiup.ren 实例创建完成 ssh端口为${docker_ssh_port}
}

}



del () {

[ -d ${user_fz_dir} ] && {
 	if [ "${user}" == "demo" ];then
        rm -rf ${nginx_run}/demo.conf    ${nginx_run}/static.conf  ${nginx_run}/upload.conf ${nginx_run}/open.conf
#	ssl_key_add deldemo
	else
        rm -rf ${nginx_run}/${docker_name}.demo.conf    ${nginx_run}/${docker_name}.static.conf ${nginx_run}/${docker_name}.upload.conf
        rm -rf ${nginx_run}/${docker_name}.demo-ssl.conf    ${nginx_run}/${docker_name}.static-ssl.conf ${nginx_run}/${docker_name}.upload-ssl.conf
	ssl_key_add del
	fi
	rm -rf  ${nginx_log}/${docker_name}.*.log 
	echo_ssl_html del
        #docker exec -it ${nginx_docker_name} supervisorctl restart nginx
        docker exec -it ${nginx_docker_name} /usr/sbin/nginx -c /tiup/conf/nginx/nginx.conf -s reload
        docker stop ${docker_name};docker rm -f ${docker_name}
        rm -rf ${user_fz_dir}
}

}


open_ssh () {
	docker port ${docker_name}|cut -d':' -f2
	${docker_run_common} /tiup/open_ssh.sh
}

docker_user_status () {

	for i in $(ls ${docker_user_dir} |grep -vE "TiUP|demo")
		do
		fz_name_text=$(ls -l ${docker_user_dir}/${i}|grep ^d|awk '{print $9}')
		[ -z "${fz_name_text}" ] || {
		echo -e "[\033[0;32m $i \033[0m]" ${fz_name_text}
		}
	done

}

reload_port () {
	docker_ssh_port="$(docker port ${docker_name}|cut -d':' -f2)"
	[ -z "${docker_ssh_port}" ] &&  {
		while [ $(ss -nlt|awk '{print $4}'|sed 1d|sed 's/::://g'|cut -d':' -f2|grep "^${docker_ssh_port}$"|wc -l) -ne 0 ];do
			docker_ssh_port="${RANDOM}"
		done
	}
	return 0
}

http_debug () {
	${docker_run_common} /tiup/debug_http.sh $1
}



[ "$1" == "add" ] && add
[ "$1" == "del" ] && del
[ "$1" == "ssh" ] && open_ssh
[ "$1" == "reload" ] && {
	reload_port && del && add
}
[ "$1" == "addssh" ] && {
	add && open_ssh
}
[ "$1" == "reloadssh" ] && {
	reload_port && del && add && open_ssh
}
[ "$1" == "status" ] && docker_user_status

[ "$1" == "httpe" ] && http_debug he
[ "$1" == "httpd" ] && http_debug hd
[ "$1" == "httpt" ] && http_debug st
