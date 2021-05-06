#!/bin/bash
sudo apt update -y
sudo apt install -y sssd sssd-tools
cd /etc/sssd/
sudo mv sssd.conf sssd.conf_default
sudo wget "https://github.com/mcetb/public/blob/main/sssd.conf"
cd /var/
sudo wget "https://github.com/mcetb/public/blob/main/ldapclient.crt"
sudo wget "https://github.com/mcetb/public/blob/main/ldapclient.key"
sudo chown root:root /etc/sssd/sssd.conf
sudo chmod 600 /etc/sssd/sssd.conf
sudo pam-auth-update --enable mkhomedir
sudo service sssd restart
sudo systemctl enable sssd