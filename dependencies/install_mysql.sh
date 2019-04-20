#!/bin/bash

apt-get update
apt-get -y install libmysqlclient-dev mysql-server-5.5
apt-get -f install mysql-server
