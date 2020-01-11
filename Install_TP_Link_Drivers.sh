#!/bin/sh
apt update
apt install -y build-essential bc linux-headers-5.2.0-kali2-amd64 git
cd /root/Documents/
git clone https://github.com/aircrack-ng/rtl8188eus.git
cd rtl8188eus
echo -e "blacklist r8188eu.ko\nblacklist r8188eu" > "/etc/modprobe.d/realtek.conf"
make all
make install
reboot
