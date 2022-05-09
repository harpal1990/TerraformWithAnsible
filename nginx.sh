#!/bin/bash
apt update 
apt-get install nginx -y
echo "this is techserverglobal" > /var/www/html/index.nginx-debian.html
systemctl start nginx
systemctl enable nginx