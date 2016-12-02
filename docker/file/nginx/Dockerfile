FROM docker-reg.tiup.ren/centos:c67

VOLUME ["/tiup"]

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum makecache && yum install -y nginx

#ADD nginx.conf	/etc/nginx/nginx.conf

CMD /usr/bin/supervisord -n
