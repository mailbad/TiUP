#!/usr/bin/env bash
your_C="CN"
your_ST="Beijing"
your_L="Beijing"
your_O="TiUP"
your_OU="TiUP Inc."
your_email="ligp@tiup.us"

SHELL_PATH="$(cd $(dirname $0);pwd -P)"


ssl_root () {

your_CN="TiUP Root CA"

cd ${SHELL_PATH}/root/

openssl genrsa -aes256 -out TiUPCA.key 8192

openssl req -sha256 -new -x509 -days 3651 -key TiUPCA.key -out TiUPCA.crt -subj "/C=${your_C}/ST=${your_ST} /L=${your_L} /O=${your_O} /OU=${your_OU} /emailAddress=${your_email} /CN=${your_CN}"

touch certindex
echo 1000 > certserial
echo 1000 > crlnumber

openssl ca -config ca.conf -gencrl -keyfile TiUPCA.key -cert TiUPCA.crt -out TiUPCA.crl.pem
openssl crl -inform PEM -in TiUPCA.crl.pem -outform DER -out TiUPCA.crl

cp -arf TiUPCA.crt  /tiup/root-key/
cp -arf TiUPCA.crl* /tiup/root-key/

}

ssl_inter () {

cd ${SHELL_PATH}/root/

your_CN="TiUP Intermediate CA"

openssl genrsa -out intermediate1.key 4096
openssl req -new -sha256 -key intermediate1.key -out intermediate1.csr  -subj "/C=${your_C}/ST=${your_ST} /L=${your_L} /O=${your_O} /OU=${your_OU} /emailAddress=${your_email} /CN=${your_CN}"
openssl ca -batch -config ca.conf -notext -in intermediate1.csr -out intermediate1.crt

openssl ca -config ca.conf -gencrl -keyfile TiUPCA.key -cert TiUPCA.crt -out TiUPCA.crl.pem
openssl crl -inform PEM -in TiUPCA.crl.pem -outform DER -out TiUPCA.crl

cp -arf intermediate1.crt intermediate1.key  TiUPCA.crl*  ../intermediate1/
cp -arf intermediate1.crt /tiup/root-key/

cd ${SHELL_PATH}/intermediate1/
touch certindex
echo 1000 > certserial
echo 1000 > crlnumber
}

domain_ssl () {
#your_CN="*.tiup.ren"
your_CN="*.${1}"
domain_name="$(echo ${your_CN}|sed 's/*.//g')"
#your_CN="*.*.demo.tiup.ren"
#domain_name="all.$(echo ${your_CN}|sed 's/*.//g')"

	[ -f ${SHELL_PATH}/user_key/${domain_name}.key ] && {
		exit
	}

	cd ${SHELL_PATH}/user_key/
	openssl genrsa -out ${domain_name}.key 4096
	[ -f ${SHELL_PATH}/user_DNS.conf ] && {
	sed -i "s/\( DNS.1 = \).*/\1"${domain_name}"/g" ${SHELL_PATH}/user_DNS.conf
	openssl req -new -nodes -sha256 -key ${domain_name}.key -out ${domain_name}.csr -config ${SHELL_PATH}/user_DNS.conf -batch -subj "/C=${your_C}/ST=${your_ST} /L=${your_L} /O=${your_O} /OU=${your_OU} /emailAddress=${your_email} /CN=${your_CN}"
	} || {
	openssl req -new -sha256 -key ${domain_name}.key -out ${domain_name}.csr  -subj "/C=${your_C}/ST=${your_ST} /L=${your_L} /O=${your_O} /OU=${your_OU} /emailAddress=${your_email} /CN=${your_CN}"
	}

	cd ${SHELL_PATH}/intermediate1/
	sed -i "s/\( DNS.0 = \).*/\1"${domain_name}"/g" ca.conf
	sed -i "s/\( DNS.1 = \).*/\1"*.${domain_name}"/g" ca.conf
	openssl ca -batch -config ca.conf -notext -in  ../user_key/${domain_name}.csr -out  ../user_key/${domain_name}.crt
	openssl ca -config ca.conf -gencrl -keyfile intermediate1.key -cert intermediate1.crt -out TiUP-intermediate1.crl.pem
	openssl crl -inform PEM -in TiUP-intermediate1.crl.pem -outform DER -out TiUP-intermediate1.crl
	cp -arf TiUP-intermediate1.crl* TiUPCA.crl* /tiup/root-key/
}

test_domain_ssl () {
	your_CN="*.${1}"
	sed -e "s/\( commonName_default = \).*/\1*.test.tiup.ren/g" -e "s/\( DNS.1 = \).*/\1test.tiup.ren/g" test.conf

}

echo ssl_root ssl_inter domain_ssl
[ "${1}" == "ssl_root" ] && {
	ssl_root 
	exit 0
}
[ "${1}" == "ssl_inter" ] && {
	ssl_inter
	exit 0
}
[ -z ${1} ] && exit
domain_ssl ${1}
