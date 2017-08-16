#!/bin/bash

# Taken from https://certbot.eff.org/#ubuntutrusty-nginx

apt-get update

apt-get install -y software-properties-common

add-apt-repository -y ppa:certbot/certbot

apt-get update

apt-get install -y python-certbot-nginx
