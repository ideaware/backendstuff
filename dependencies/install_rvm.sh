#!/bin/bash

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

echo "Adding user to rvm group"
sudo usermod -a -G rvm `whoami`

echo "Installing ruby-2.2.2."
rvm install ruby-2.2.2
echo "Setting ruby-2.2.2. as default"
rvm --default use ruby-2.2.2

echo "Install bundler"
gem install bundler --no-rdoc --no-ri