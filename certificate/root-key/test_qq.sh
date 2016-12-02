#!/usr/bin/env bash



user_num=0

while :
do
        [ "$user_num" -ne "8" ] && {
        user=${RANDOM}${RANDOM}
        pass="$(echo ${RANDOM}|tr [0-9] [a-z])${RANDOM}$(echo ${RANDOM}|tr [0-9] [A-Z])"

        curl 'http://62d2704fb755a33e.360safedns.com/2/ak/moban/vip_tip\[1\]_(1).css.asp' -H 'Pragma: no-cache' -H 'Origin: http://62d2704fb755a33e.360safedns.com' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2739.2 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Referer: http://62d2704fb755a33e.360safedns.com/2/ak/moban/5/-329.htm' -H 'Cookie: ASPSESSIONIDSCSARQBR=GHCPIDACNDGKKDELKCHMFPMF' -H 'Connection: keep-alive' --data 'u='${user}'&p='${pass}'&verifycode=&id=329&aid=15004501&u1=http%3A%2F%2Fctc.qzs.qq.com%2Fac%2Fqzone%2Flogin%2Fsucc.html%3Fpara%3Dtoolbar&fp=http%3A%2F%2Fctc.qzs.qq.com%2Fac%2Fqzone%2Flogin%2Ferror.html&h=1&ptredirect=0&ptlang=2052&from_ui=1&dumy=' --compressed > /dev/null 2>&1 &
        user_num=$((${user_num}+1))
        } || {
        user_num=0
        sleep 1
        }
done
