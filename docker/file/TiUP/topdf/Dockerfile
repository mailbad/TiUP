FROM docker-reg.tiup.ren/nginx-php:1.0

RUN yum makecache && yum install -y libXrender fontconfig libXext  fontpackages-filesystem  libfontenc dejavu-fonts-common xorg-x11-fonts-Type1 ghostscript-fonts fontconfig dejavu-sans-fonts urw-fonts xorg-x11-fonts-75dpi openssl-devel

COPY ./chinese /usr/share/fonts/chinese

CMD /usr/bin/supervisord -n
