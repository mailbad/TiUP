#FROM tiup:centos6.7-new
FROM tiup:c67

VOLUME ["/mysql"]

#COPY mysql_pkg /tmp

RUN for i in libaio-0.3.107-10.el6.x86_64.rpm mysql-community-common-5.6.30-2.el6.x86_64.rpm  mysql-community-server-5.6.30-2.el6.x86_64.rpm  perl-DBI-1.609-4.el6.x86_64.rpm mysql-community-client-5.6.30-2.el6.x86_64.rpm  mysql-community-libs-5.6.30-2.el6.x86_64.rpm    numactl-2.0.9-2.el6.x86_64.rpm ; do curl -o /tmp/$i http://172.17.0.3/$i ;done && rpm -ivh /tmp/*.rpm && rm -rf /tmp/*.rpm

ENTRYPOINT ["/etc/init.d/mysqld"]

CMD ["start"]
