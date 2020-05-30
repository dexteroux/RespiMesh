#!/bin/bash

sudo ip link set dev wlan0 down
sudo iw wlan0 set type ibss
sudo ip link set dev wlan0 mtu 1500
sudo iwconfig wlan0 channel 3
sudo ip link set dev wlan0 up
sudo iw wlan0 ibss join "rpi_mesh" 2432 
#10:20:34:54:09:02

# batman-adv interface to use
sudo batctl if add wlan0
#sudo ifconfig bat0 mtu 1468
sudo ip link set dev bat0 mtu 1468

# Tell batman-adv this is a gateway client
sudo batctl gw_mode client

# Activates batman-adv interfaces
#sudo ifconfig wlan0 up
#sudo ifconfig bat0 up
sudo ip link set dev wlan0 up
sudo ip link set dev bat0 up
sudo ip addr add 172.27.0.1/16 dev bat0
