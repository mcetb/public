#!/bin/sh
apt-get update -y
apt install sssd -y
apt install sssd-tools -y
wget "https://raw.githubusercontent.com/mcetb/public/main/sssd.conf" -O "/etc/sssd/sssd.conf"
wget "https://raw.githubusercontent.com/mcetb/public/main/ldapclient.crt" -O "/var/ldapclient.crt"
wget "https://raw.githubusercontent.com/mcetb/public/main/ldapclient.key" -O "/var/ldapclient.key"
chown root:root /etc/sssd/sssd.conf
chmod 600 /etc/sssd/sssd.conf
pam-auth-update --enable mkhomedir
service sssd restart
systemctl enable sssd