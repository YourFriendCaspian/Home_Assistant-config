#!/bin/bash

# sudo -u homeassistant -H -s - issue this first then run script

sudo su -s /bin/bash homeassistant <<EOF
cd /home/homeassistant/.homeassistant
source /srv/homeassistant/bin/activate
hass --script check_config
git add .
git status
echo -n "Enter the Description for the Change: " [Minor Update]
exit
EOF
read CHANGE_MSG
sudo su -s /bin/bash homeassistant <<EOF
cd /home/homeassistant/.homeassistant
git commit -m "${CHANGE_MSG}"
git push origin master
exit
EOF
