FROM docker-reg.tiup.ren/centos:c67

#RUN yum makecache && yum install -y git npm && npm install -g pomelo && npm i -g supervisor
RUN yum makecache && yum install -y git npm && npm install -g pomelo 

CMD /usr/bin/supervisord -n
