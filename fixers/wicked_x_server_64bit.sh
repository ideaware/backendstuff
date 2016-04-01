#!/bin/bash

# .deb process
# first dependencies
# source http://stackoverflow.com/a/34947598/1407371
apt-get install openssl build-essential xorg libssl-dev xfonts-75dpi

wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2/wkhtmltox-0.12.2_linux-trusty-amd64.deb
dpkg -i wkhtmltox-0.12.2_linux-trusty-amd64.deb

echo "Testing"
wkhtmltopdf http://www.google.com google.pdf

# old way not so reliable
# source http://www.stormconsultancy.co.uk/blog/development/generating-pdfs-in-rails-with-pdfkit-and-deploying-to-a-server/
# tar process
#wget http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.9.9-static-amd64.tar.bz2
#tar xvjf wkhtmltopdf-0.9.9-static-amd64.tar.bz2
#mv wkhtmltopdf-amd64 /usr/local/bin/wkhtmltopdf
#chmod +x /usr/local/bin/wkhtmltopdf