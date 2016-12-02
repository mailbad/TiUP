FROM docker-reg.tiup.ren/centos:c67

ADD zeroc-ice-rhel6.repo /etc/yum.repos.d/zeroc-ice-rhel6.repo

#DBPROXY WEBPROXY JAVA
RUN rpm -ivh http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm  && yum clean all && yum makecache && yum install -y mysql-community-libs-compat ice-libs libmemcached java ice-java-devel && ln -s /usr/lib64/libmemcached.so.2.0.0 /usr/lib64/libmemcached.so.10

CMD /usr/bin/supervisord -n
