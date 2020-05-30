#!/bin/bash
# Onetime Execute
#sudo cp 100-mesh-init.yaml /etc/netplan/100-mesh-init.yaml
#sudo netplan --debug apply
## Ensure the batman-adv kernel module is loaded at boot time
#echo 'batman-adv' | sudo tee --append /etc/modules
## Stop the DHCP process from trying to manage the wireless lan interface
#echo 'denyinterfaces wlan0' | sudo tee --append /etc/dhcpcd.conf
#echo 'net.ipv4.icmp_echo_ignore_broadcasts=0' | sudo tee --append /etc/sysctl.conf

sudo mkdir -p /etc/scripts
sudo cp wpa-wlan0.conf /etc/scripts/wpa-wlan0.conf
sudo chmod 744 /etc/scripts/wpa-wlan0.conf
sudo cp wpa-wlan0.conf /etc/scripts/wpa-wlan1.conf
sudo chmod 744 /etc/scripts/wpa-wlan1.conf

sudo cp start-batman-adv.sh /etc/scripts/start-batman-adv.sh
sudo chmod 744 /etc/scripts/start-batman-adv.sh

sudo cp wpasupplicant_wlan0.service /etc/systemd/system/wpasupplicant_wlan0.service
sudo chmod 664 /etc/systemd/system/wpasupplicant_wlan0.service

sudo cp batman-adv.service /etc/systemd/system/batman-adv.service
sudo chmod 664 /etc/systemd/system/batman-adv.service

sudo systemctl daemon-reload

sudo systemctl enable wpasupplicant_wlan0.service
sudo systemctl start wpasupplicant_wlan0.service

sudo systemctl enable batman-adv.service
sudo systemctl start batman-adv.service

