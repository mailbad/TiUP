FROM docker-reg.tiup.ren/centos:c67

VOLUME ["/tiup"]

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum makecache && yum install -y nginx php php-fpm php-mysql

ADD php.ini /etc/php.ini

CMD /usr/bin/supervisord -n
