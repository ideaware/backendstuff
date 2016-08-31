#!/bin/bash

set -e

# Install nodejs
if grep -q +nodejs .provisioning-progress; then
	echo "--> NodeJS already installed, moving on."
else
	echo "--> Installing nodeJS"
	apt-add-repository ppa:chris-lea/node.js
	apt-get update
	apt-get -y install nodejs # needed by Rails to have a Javascript runtime
  su macsa -c "echo +nodejs >> /home/macsa/.provisioning-progress"
	echo "--> nodeJS is now installed"
fi

# Install postgresql
if grep -q +postgresql .provisioning-progress; then
  echo "--> postgresql already installed, moving on."
else
  echo "--> Installing postgresql..."
  apt-get update
  apt-get -y install postgresql
  apt-get -y install libpq-dev
  su kisstle -c "echo +postgresql >> /home/kisstle/.provisioning-progress"
  echo "--> +postgresql is now installed."
fi

echo "All done"