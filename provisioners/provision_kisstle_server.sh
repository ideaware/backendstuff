#!/bin/bash

set -e
 
if [ ! -f /home/kisstle/.provisioning-progress ]; then
  su kisstle -c "touch /home/kisstle/.provisioning-progress"
  echo "--> Progress file created in /home/kisstle/.provision-progress"
  apt-get update
else
  echo "--> Progress file exists in /home/kisstle/.provisioning-progress"
fi

# Install Git, Build-essential, curl, vim, htop
if grep -q +core-libs .provisioning-progress; then
  echo "--> Core libs (git, curl, etc) already installed, moving on."
else
  echo "--> Installing core libs (git, curl, etc)..."
  apt-get update
  apt-get -y install build-essential curl git-core python-software-properties htop vim libfontconfig1 libgmp-dev
  apt-get -y install zlib1g-dev libssl-dev libreadline6-dev libyaml-dev libncurses5-dev libxml2-dev libxslt-dev libsqlite3-dev
  su kisstle -c "echo +core-libs >> /home/kisstle/.provisioning-progress"
  echo "--> Core libs (git, curl, etc) are now installed."
fi

# Install ruby
if grep -q +ruby/2.2.2 .provisioning-progress; then
  echo "--> ruby-2.2.2 is installed, moving on."
else
  echo "--> Installing ruby-2.2.2 ..."
  su kisstle -c "mkdir -p /home/kisstle/downloads; cd /home/kisstle/downloads; \
                 wget --no-check-certificate https://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz; \
                 tar -xvf ruby-2.2.2.tar.gz; cd ruby-2.2.2; \
                 mkdir -p /home/kisstle/ruby; \
                 ./configure --prefix=/home/kisstle/ruby --disable-install-doc; \
                 make; make install;"
  sudo -u kisstle printf 'export PATH=/home/kisstle/ruby/bin:$PATH\n' >> /home/kisstle/.profile
 
  su kisstle -c "echo +ruby/2.2.2 >> /home/kisstle/.provisioning-progress"
  echo "--> ruby-2.2.2 is now installed."
fi

# Install nodejs
if grep -q +nodejs .provisioning-progress; then
  echo "--> NodeJS already installed, moving on."
else
  echo "--> Installing nodeJS"
  apt-add-repository ppa:chris-lea/node.js
  apt-get update
  apt-get -y install nodejs
  su kisstle -c "echo +nodejs >> /home/kisstle/.provisioning-progress"
  echo "--> nodeJS is now installed"
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
  su kisstle -c "echo +redis >> /home/kisstle/.provisioning-progress"
  echo "--> +redis is now installed."
fi

# Install ImageMagick
if grep -q +imagemagick .provisioning-progress; then
  echo "--> imagemagick already installed, movin on."
else
  echo "--> Installing Image magick in the machine..."
  apt-get update
  apt-get -y install libpng12-dev libglib2.0-dev zlib1g-dev libbz2-dev libtiff4-dev libjpeg8-dev
  mkdir -p ~/image_magick_download
  cd ~/image_magick_download
  wget http://www.imagemagick.org/download/ImageMagick.tar.gz
  tar -xzf ImageMagick.tar.gz
  cd ImageMagick-*
  echo "Proceding to compile ImageMagick"
  sudo ./configure
  sudo make
  sudo make install
  sudo ldconfig /usr/local/lib
  echo "Image magick installation is now completed... Hopefully"
fi

echo "All done"

