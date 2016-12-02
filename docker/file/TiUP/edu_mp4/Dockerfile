FROM docker-reg.tiup.ren/nginx-php:1.0

RUN rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm && yum makecache && yum install -y yamdi ffmpeg

CMD /usr/bin/supervisord -n
