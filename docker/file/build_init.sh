#!/usr/bin/env bash
SHELL_PATH="$(cd $(dirname $0);pwd -P)"
docker_uri=docker-reg.tiup.ren

docker pull ${docker_uri}/centos:6.7

init_system () {
	echo init system centos:c67
	cd ${SHELL_PATH}/centos6.7
	docker build -t ${docker_uri}/centos:c67 .
}

init_cache_nginx () {
	echo init 依赖于 centos:c67
	for i in imserver memcache nginx nginx+php-fpm rabbitmq redis rsync_images TiUP/ice 
		do
		cd ${SHELL_PATH}/${i}
		version=1.0
		[ "$i" == "rsync_images" ] && i=rsync
		[ "$i" == "nginx+php-fpm" ] && i=nginx-php
		[ "$i" == "TiUP/ice" ] && i=ice
		[ "$i" == "ice" ] && version=3.4
		[ "$i" == "rsync" ] && version=1.7.0
		[ "$i" == "rabbitmq" ] && version=3.6.2
		[ "$i" == "memcached" ] && version=1.4.4
		[ "$i" == "redis" ] && version=2.4.10
		[ "$i" == "nginx" ] && version=1.8.1
		docker build -t ${docker_uri}/$i:${version} .
		unset i version
	done

}

init_over_server () {
	echo init 依赖于 ice php 等
		
	for i in  topdf webserver edu_mp4
		do
		cd ${SHELL_PATH}/TiUP/${i}
                version=1.0
	        docker build -t ${docker_uri}/$i:${version} .
		unset i version
	done
}

init_system && \
init_cache_nginx && \
init_over_server
