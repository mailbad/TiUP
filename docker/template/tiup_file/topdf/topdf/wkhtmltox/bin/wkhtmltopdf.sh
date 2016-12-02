PAHT=$PATH:/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
/usr/bin/xvfb-run -d -a -s "-screen 0 640x480x16" /usr/local/bin/wkhtmltopdf $*
