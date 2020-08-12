#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


adong() {

ls -lth /var/spool/mail/

cat /dev/null > /var/spool/mail/root

ls -lth /var/spool/mail/


ls -lth /var/log/v2ray

cat /dev/null > /var/log/v2ray/access.log

cat /dev/null > /var/log/v2ray/error.log

ls -lth /var/log/v2ray


ls -lth /etc/nginx/logs

cat /dev/null > /etc/nginx/logs/access.log

cat /dev/null > /etc/nginx/logs/error.log

ls -lth /etc/nginx/logs


}



adong

