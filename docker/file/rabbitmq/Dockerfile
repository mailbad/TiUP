FROM docker-reg.tiup.ren/centos:c67

RUN rpm --import https://www.rabbitmq.com/rabbitmq-signing-key-public.asc && rpm -ivh http://www.rabbitmq.com/releases/erlang/erlang-18.3-1.el6.x86_64.rpm && yum makecache && yum install -y http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.2/rabbitmq-server-3.6.2-1.noarch.rpm

CMD /usr/bin/supervisord -n
