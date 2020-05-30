#!/bin/bash

mkdir -p /etc/scripts
cp start-batman-adv.sh /etc/scripts/start-batman-adv.sh
chmod 744 /etc/scripts/start-batman-adv.sh
cp batman-adv.service /etc/systemd/system/batman-adv.service
chmod 664 /etc/systemd/system/batman-adv.service
systemctl daemon-reload
systemctl enable batman-adv.service

