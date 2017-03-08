#!/bin/bash

# Install or verify unattended upgrades is installed
apt-get update
apt-get install -y unattended-upgrades

# Select Yes to reconfigure to generate file /etc/apt/apt.conf.d/20auto-upgrades
dpkg-reconfigure unattended-upgrades

# Change /etc/apt/apt.conf.d/20auto-upgrades for ./20auto-upgrades
# See 20auto-upgrades explanation here: https://gist.github.com/cesc1989/b4c685b6ca41f777949780c9729a3b70
if [ -f "/etc/apt/apt.conf.d/20auto-upgrades" ]; then
  rm /etc/apt/apt.conf.d/20auto-upgrades
fi

cp ./20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
