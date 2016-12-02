FROM docker-reg.tiup.ren/ice:3.4

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum makecache && yum install -y nginx php-fpm php ice-php php-mysql php-pecl-memcached php-pecl-memcache php-pecl-redis php-mbstring php-pecl-imagick rsync zip unzip npm php-gd && npm install node-xlsx

CMD /usr/bin/supervisord -n
