#!/bin/bash

set -e
 
if [ ! -f /home/kisstle/.provisioning-progress ]; then
  su kisstle -c "touch /home/kisstle/.provisioning-progress"
  echo "--> Progress file created in /home/kisstle/.provision-progress"
  apt-get update
else
  echo "--> Progress file exists in /home/kisstle/.provisioning-progress"
fi

# Install rvm
if grep -q +rvm .provisioning-progress; then
  echo "--> rvm are installed, moving on."
else
  echo "--> Installing rvm ..."
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
  su kisstle -c "echo +rvm >> /home/kisstle/.provisioning-progress"
  
  echo "Follow steps in dependencies/install_rvm.sh to install Ruby 2.2.2"
  
  echo "--> rvm is now installed."
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

