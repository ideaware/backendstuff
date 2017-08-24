#!/bin/bash

sudo pip install awscli

mkdir ~/.aws

touch ~/.aws/config

# Taken from https://stackoverflow.com/a/17093489/1407371
tee ~/.aws/config <<- EOF > /dev/null
[default]
region=us-east-1
output=json
EOF
