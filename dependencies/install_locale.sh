#!/bin/bash

# Sometimes, this doesn't work
#
# echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
# locale-gen en_US.UTF-8
# update-locale LANG=en_US.UTF-8

# See http://askubuntu.com/a/144448/167553

# Manually fixing locales:
# A) sudo dpkg-reconfigure locales
# B) sudo apt-get --reinstall install language-pack-en
# C) sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# See https://askubuntu.com/a/144244/167553

echo export LANGUAGE=en >> ~/.profile
echo export LC_ALL=en_US.UTF-8 >> ~/.profile

. ~/.profile
