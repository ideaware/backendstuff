#!/bin/bash

# source http://stackoverflow.com/a/34947598/1407371

apt-get install xfonts-75dpi
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2/wkhtmltox-0.12.2_linux-trusty-i386.deb
dpkg -i wkhtmltox-0.12.2_linux-trusty-i386.deb

echo "Testing"
wkhtmltopdf http://www.google.com google.pdf