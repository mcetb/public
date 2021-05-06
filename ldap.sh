#!/bin/bash
cd /opt/
wget "https://raw.githubusercontent.com/mcetb/public/main/ldap.sh"
sh ldap.sh
cd /etc/sssd/
mv sssd.conf sssd.conf_default
wget "https://raw.githubusercontent.com/mcetb/public/main/sssd.conf"
cd /var/
wget "https://raw.githubusercontent.com/mcetb/public/main/ldapclient.crt"
wget "https://raw.githubusercontent.com/mcetb/public/main/ldapclient.key"
chown root:root /etc/sssd/sssd.conf
chmod 600 /etc/sssd/sssd.conf
pam-auth-update --enable mkhomedir
service sssd restart
systemctl enable sssd