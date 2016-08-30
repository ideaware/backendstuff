#!/bin/bash
# Do not run as sudo or there could be trouble setting up RVM

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

echo "Sourcing RVM and reloading shell"
. ~/.rvm/scripts/rvm

echo "RVM requirements"
rvm requirements

echo "Installing ruby-2.2.2."
rvm install ruby-2.2.2

echo "Setting ruby-2.2.2. as default"
rvm --default use ruby-2.2.2

echo "Install bundler"
gem install bundler --no-rdoc --no-ri

echo "...again"
. ~/.rvm/scripts/rvm