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
  echo "--> ruby-2.2.2 and rvm are installed, moving on."
else
  echo "--> Installing ruby-2.2.2 and rvm ..."
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
  su macsa -c "echo +rvm >> /home/macsa/.provisioning-progress"

  echo "Adding user to rvm group"
  sudo usermod -a -G rvm `whoami`

  echo "Installing ruby-2.2.2."
  rvm install ruby-2.2.2
  
  echo "Setting ruby-2.2.2. as default"
  rvm --default use ruby-2.2.2

  echo "Install bundler"
  gem install bundler --no-rdoc --no-ri
  
  echo "--> rvm is now installed."
fi

# Install bundler
if grep -q +bundler .provisioning-progress; then
  echo "--> bundler already installed, moving on."
else
  echo "--> Installing bundler..."
  su kisstle -c "/home/kisstle/ruby/bin/gem install bundler --no-ri --no-rdoc"
  su kisstle -c "echo +bundler >> /home/kisstle/.provisioning-progress"
  echo "--> +bundler is now installed."
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
