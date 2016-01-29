#!/bin/bash

set -e
 
if [ ! -f /home/macsa/.provisioning-progress ]; then
  su macsa -c "touch /home/macsa/.provisioning-progress"
  echo "--> Progress file created in /home/macsa/.provision-progress"
  apt-get update
else
  echo "--> Progress file exists in /home/macsa/.provisioning-progress"
fi

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
 
# Install ruby
if grep -q +ruby/2.2.2 .provisioning-progress; then
  echo "--> ruby-2.2.2 is installed, moving on."
else
  echo "--> Installing ruby-2.2.2 ..."
  su macsa -c "mkdir -p /home/macsa/downloads; cd /home/macsa/downloads; \
                 wget --no-check-certificate https://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz; \
                 tar -xvf ruby-2.2.2.tar.gz; cd ruby-2.2.2; \
                 mkdir -p /home/macsa/ruby; \
                 ./configure --prefix=/home/macsa/ruby --disable-install-doc; \
                 make; make install;"
  sudo -u macsa printf 'export PATH=/home/macsa/ruby/bin:$PATH\n' >> /home/macsa/.profile
 
  su macsa -c "echo +ruby/2.2.2 >> /home/macsa/.provisioning-progress"
  echo "--> ruby-2.2.2 is now installed."
fi

# Install bundler
if grep -q +bundler .provisioning-progress; then
  echo "--> bundler already installed, moving on."
else
  echo "--> Installing bundler..."
  su macsa -c "/home/macsa/ruby/bin/gem install bundler --no-ri --no-rdoc"
  su macsa -c "echo +bundler >> /home/macsa/.provisioning-progress"
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
  su macsa -c "echo +postgresql >> /home/macsa/.provisioning-progress"
  echo "--> +postgresql is now installed."
fi

# Install redis
if grep -q +redis .provisioning-progress; then
  echo "--> redis already installed, moving on."
else
  echo "--> Installing redis..."
  apt-get update
  apt-get -y install tcl8.5
  curl -sSL http://download.redis.io/releases/redis-stable.tar.gz -o /tmp/redis.tar.gz
  mkdir -p /tmp/redis
  tar -xzf /tmp/redis.tar.gz -C /tmp/redis --strip-components=1
  make -C /tmp/redis
  make -C /tmp/redis install
  echo -n | /tmp/redis/utils/install_server.sh
  rm -rf /tmp/redis*
  sysctl vm.overcommit_memory=1
  sed -ie 's/# bind 127.0.0.1/bind 127.0.0.1/g' /etc/redis/6379.conf
  service redis_6379 restart
  su macsa -c "echo +redis >> /home/macsa/.provisioning-progress"
  echo "--> +redis is now installed."
fi

#Set the system locale
if grep -q +locale .provisioning-progress; then
  echo "--> Locale already set, moving on."
else
  echo "--> Setting the system locale..."
  echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
  locale-gen en_US.UTF-8
  update-locale LANG=en_US.UTF-8
  su macsa -c "echo +locale >> /home/macsa/.provisioning-progress"
  echo "--> Locale is now set."
fi


echo "All done"

