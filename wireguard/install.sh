#!/bin/bash

{
echo "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# Remove any previous installation is present
sudo rm /etc/wireguard/wg0.conf

} &> /dev/null


git clone https://git.zx2c4.com/wireguard-tools
make -C wireguard-tools/src -j$(nproc)
make -C wireguard-tools/src install

wget https://raw.githubusercontent.com/redzonerobotics/install/master/wireguard/wg0.conf
mkdir -p /etc/wireguard
chmod 700 /etc/wireguard
mv wg0.config /etc/wireguard/wg0.conf
chown root:root /etc/wireguard/wg0.conf

systemctl enable wg-quick@wg0.service
systemctl start wg-quick@wg0.service

rm -rf wireguard-tools
