#!/usr/bin/env bash

# crontab -e to edit a crontab file
# crontab task at 03:00 every day it use ./monit to restart PM2 instance replace your own restart system (appache, nodejs ...)
0 3 * * * cd /etc/letsencrypt/ && ./certbot-auto renew && cd /etc/tasks && ./monit -r

