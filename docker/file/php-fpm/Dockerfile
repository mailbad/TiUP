FROM tiup:c67

VOLUME ["/tiup"]

RUN yum makecache && yum install -y php-fpm

#ADD php.ini	/etc/php.ini

CMD /usr/bin/supervisord -n
