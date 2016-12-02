#!/usr/bin/env bash

#ruc test lnu immu bit bjtiup oc tiup gosick columbia rbs upc bzu

school_name="ruc test immu bit bjtiup oc tiup rbs upc bzu kzjsxy"
#url_domain_name="static uplod 404 edu-storage imserver open pic-img staticjs rpacl search supervisorctl tcs uc api"
url_domain_name="static uplod 404 edu-storage imserver open pic-img staticjs rpacl search tcs uc api"
#url_domain_name="static uplod 404 open"
domain_server_name="demo.tiup.ren"

cd /tiup/pam_key;
init_sys () {
yum install -y wget
rm -rf letsencrypt.*
wget https://raw.githubusercontent.com/xdtianyu/scripts/master/lets-encrypt/letsencrypt.conf
wget https://raw.githubusercontent.com/xdtianyu/scripts/master/lets-encrypt/letsencrypt.sh

chmod +x letsencrypt.sh

sed -i -e 's/example.com.key/${domain_server_name}.key/g' -e 's/\/var\/www\/example.com/\/tiup\/www/g' -e 's/DNS:example.com,DNS:www.example.com/DNS:${domain_server_name}/g' letsencrypt.conf 

}

demo_key_init () {

	[ "$1" == "demo" ] && {
	#domain_rename="echo  ${school_name} ${url_domain_name}|sed -e "s/ /.${domain_server_name}/g" -e "s/$/.${domain_server_name}/g")"
	DNS_name="$(echo ${school_name} ${url_domain_name} |sed -e "s/ /.${domain_server_name} /g" -e "s/$/.${domain_server_name}/g" -e 's/ /,DNS:/g' )"
	domain_name="${domain_server_name}"
	} || {
	#domain_rename="echo  ${school_name} ${url_domain_name}|sed -e "s/ /.${1}.${domain_server_name}/g" -e "s/$/.${1}.${domain_server_name}/g")"
	DNS_name="$(echo ${school_name} ${url_domain_name} |sed -e "s/ /.${1}.${domain_server_name} /g" -e "s/$/.${1}.${domain_server_name}/g" -e 's/ /,DNS:/g' )"
	domain_name="${1}.${domain_server_name}"
	}
	sed -i -e "s/\(DOMAIN_KEY=\).*/\1\"${domain_name}.key\"/g" -e "s/\(DOMAINS=\"DNS:\).*/\1${DNS_name}\"/g" letsencrypt.conf 
	echo ${school_name} ${url_domain_name} |sed "s/ /.${domain_name} /g"|sed "s/$/.${domain_name}/g" |sed "s/^/127.0.0.1     ${domain_name} /g" >> /etc/hosts
	./letsencrypt.sh letsencrypt.conf
	sed -i "/\(127.0.0.1     ${domain_name}\).*/d"  /etc/hosts
	mv ${domain_name%%.*}.crt ${domain_name}.crt
	rm -rf *.chained.crt *.csr *.pem
}

[ "$1" == "init_sys" ] && {
	init_sys
	exit 0
}
demo_key_init $@
