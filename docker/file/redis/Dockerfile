FROM docker-reg.tiup.ren/centos:c67

RUN yum makecache && yum install -y redis

ADD redis.conf /etc/redis.conf

CMD /usr/bin/supervisord -n
