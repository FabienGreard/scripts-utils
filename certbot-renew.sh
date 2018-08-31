#!/usr/bin/env bash

# crontab -e to edit a crontab file
# crontab task at 03:00 every day
0 3 * * * cd /etc/letsencrypt/ && ./certbot-auto renew && cd /etc/tasks && ./restart
# must reload the whole server thing
