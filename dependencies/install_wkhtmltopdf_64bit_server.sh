#!/bin/bash

apt-get update
apt-get install openssl build-essential xorg libssl-dev xfonts-75dpi

wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2/wkhtmltox-0.12.2_linux-trusty-amd64.deb
dpkg -i wkhtmltox-0.12.2_linux-trusty-amd64.deb