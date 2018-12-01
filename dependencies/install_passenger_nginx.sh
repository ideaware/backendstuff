#!/bin/bash

###
# CONFIGURATION FOR UBUNTU 18.04
###

apt-get install -y apt-transport-https ca-certificates dirmngr gnupg
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7

sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
apt-get update

apt-get install -y libnginx-mod-http-passenger

echo "For Ubuntu 14.04 see https://www.phusionpassenger.com/docs/tutorials/deploy_to_production/installations/oss/ownserver/ruby/nginx/"