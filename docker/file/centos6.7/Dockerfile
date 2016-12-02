FROM docker-reg.tiup.ren/centos:6.7

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup && curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo && yum clean all && yum makecache && yum install -y epel-release && yum makecache && yum install -y openssh-server passwd vim python-pip python-meld3 cronie openssl-devel && pip install supervisor && cp -arf /etc/pki/tls/certs/ca-bundle.crt{,.bak} && curl ssl.tiup.ren/tiup.chains >> /etc/pki/tls/certs/ca-bundle.crt && pip install --upgrade pip
ADD supervisord.conf /etc/supervisord.conf
RUN /etc/init.d/sshd start && /etc/init.d/sshd stop

CMD ["/usr/bin/supervisord -n"]  
