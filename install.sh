#!/bin/bash

#sudo cp 100-mesh-init.yaml /etc/netplan/100-mesh-init.yaml
#sudo netplan --debug apply
## Ensure the batman-adv kernel module is loaded at boot time
#echo 'batman-adv' | sudo tee --append /etc/modules
## Stop the DHCP process from trying to manage the wireless lan interface
#echo 'denyinterfaces wlan0' | sudo tee --append /etc/dhcpcd.conf

sudo mkdir -p /etc/scripts
sudo cp start-batman-adv.sh /etc/scripts/start-batman-adv.sh
sudo chmod 744 /etc/scripts/start-batman-adv.sh
sudo cp batman-adv.service /etc/systemd/system/batman-adv.service
sudo chmod 664 /etc/systemd/system/batman-adv.service
sudo systemctl daemon-reload
sudo systemctl enable batman-adv.service
sudo systemctl start batman-adv.service

