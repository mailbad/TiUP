FROM docker-reg.tiup.ren/centos:c67

VOLUME ["/data"]

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && yum makecache && yum install -y  --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof php-gd php-fpm
