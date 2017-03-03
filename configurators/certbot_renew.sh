#!/bin/bash

# 1. Symlink ./letsencrypt to /etc/cron.monthly/letsencrypt

sudo ln -sf ./letsencrypt /etc/cron.monthly/

# 2. Make it executable

sudo chmod u=rwx,go=rx /etc/cron.monthly/letsencrypt