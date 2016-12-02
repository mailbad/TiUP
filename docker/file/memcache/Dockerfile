FROM docker-reg.tiup.ren/centos:c67

RUN yum makecache && yum install -y memcached

CMD /usr/bin/supervisord -n
