#!/bin/bash

curl https://repo.varnish-cache.org/ubuntu/GPG-key.txt | apt-key add -

echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list

apt-get update
apt-get -y install varnish
