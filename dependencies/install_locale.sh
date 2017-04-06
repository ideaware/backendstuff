#!/bin/bash

# This no longer works, don't know why
#
# echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
# locale-gen en_US.UTF-8
# update-locale LANG=en_US.UTF-8

# See http://askubuntu.com/a/144448/167553

echo export LANGUAGE=en >> ~/.profile
echo export LC_ALL=en_US.UTF-8 >> ~/.profile

. ~/.profile
