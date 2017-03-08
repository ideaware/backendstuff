#!/bin/bash

# 1. Symlink ./letsencrypt to /etc/cron.monthly/letsencrypt

ln -sf /home/ubuntu/backendstuff/configurators/letsencrypt/letsencrypt_cert_renewal \
       /etc/cron.monthly/letsencrypt_cert_renewal

# 2. Make it executable

chmod u=rwx,go=rx /etc/cron.monthly/letsencrypt_cert_renewal
