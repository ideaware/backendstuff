#!/bin/bash

apt-get update
apt-get -y install xfonts-75dpi

wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.2/wkhtmltox-0.12.2_linux-trusty-i386.deb
dpkg -i wkhtmltox-0.12.2_linux-trusty-i386.deb
