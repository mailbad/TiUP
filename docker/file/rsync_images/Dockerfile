FROM docker-reg.tiup.ren/centos:c67

VOLUME ["/tiup"]

EXPOSE 873

RUN yum makecache && yum install -y rsync

CMD rsync --daemon --config=/tiup/rsyncd.conf --no-detach
