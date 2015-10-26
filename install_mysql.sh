#!/bin/bash

apt-get update
apt-get -y install libmysqlclient-dev
apt-get -y install mysql-server-5.5
apt-get -f install mysql-server