#!/bin/bash

sudo pip install awscli

mkdir ~/.aws

touch ~/.aws/config

tee ~/.aws/config <<- EOF > /dev/null
[default]
region=us-east-1
output=json
EOF
