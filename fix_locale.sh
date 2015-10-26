#!/bin/bash

echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8