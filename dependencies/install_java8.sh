#!/bin/bash

# Java8 doesn't have an official PPA so it needs to be installed from a third party.
# See Ask Ubuntu about it: https://askubuntu.com/a/944260/167553

# Commands taken from http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html

add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get -y install oracle-java8-installer
