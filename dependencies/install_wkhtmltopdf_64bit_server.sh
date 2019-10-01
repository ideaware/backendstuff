#!/bin/bash

apt-get update
apt-get install -y openssl build-essential xorg libssl-dev xfonts-75dpi

wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.2/wkhtmltox-0.12.2_linux-trusty-amd64.deb
dpkg -i wkhtmltox-0.12.2_linux-trusty-amd64.deb
