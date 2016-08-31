#!/bin/bash

# Installs CodeDeploy Agent in Ubuntu 14.04 server

sudo apt-get update

# ruby2.0 is mandatory

sudo apt-get -y install python-pip ruby2.0 wget

# Just to make sure user is located in home folder
# Ubuntu is the default name for Ubuntu servers in AWS
cd /home/ubuntu

# wget https://bucket-name.s3.amazonaws.com/latest/install
# where bucket-name is the name for the region of the instances
# See the complete list here: 
# http://docs.aws.amazon.com/codedeploy/latest/userguide/how-to-run-agent-install.html?shortFooter=true#how-to-run-agent-install-ubuntu

wget https://aws-codedeploy-us-west-2.s3.amazonaws.com/latest/install

chmod +x ./install

sudo ./install auto

# Command to make sure agent is running
# sudo service codedeploy-agent status

# For uninstalling issue
# sudo dpkg -r codedeploy-agent