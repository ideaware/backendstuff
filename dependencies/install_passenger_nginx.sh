#!/bin/bash

#Taken from https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/trusty/install_passenger.html

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
apt-get install -y apt-transport-https ca-certificates

sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'
apt-get update

apt-get install -y nginx-extras passenger

echo "Remember you need to uncomment lines 'passenger_root' and 'passenger_ruby' in '/etc/nginx/nginx.conf' file"
echo "and then restart nginx with 'sudo service nginx restart'"