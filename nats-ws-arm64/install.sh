#!/bin/bash

{
echo "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# Remove any previous installation is present
systemctl stop nats-server
systemctl disable nats-server
sudo rm /usr/share/nats/nats.conf
sudo rm /usr/local/bin/nats-server
sudo rm /etc/systemd/system/nats-server.service
sudo rm /etc/systemd/system/multi-user.target.wants/nats-server.service
} &> /dev/null

wget https://raw.githubusercontent.com/redzonerobotics/install/master/nats-ws-arm64/nats-server
cp nats-server /usr/local/bin/nats-server
chmod +x /usr/local/bin/nats-server
rm nats-server

wget https://raw.githubusercontent.com/redzonerobotics/install/master/nats-ws-arm64/nats.conf
mkdir -p /usr/share/nats
cp nats.conf /usr/share/nats/nats.conf
rm nats.conf

echo "[Unit]
Description=NATS Server service.
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/local/bin/nats-server -c /usr/share/nats/nats.conf
RestartSec=2
Restart=always

User=1000

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/nats-server.service

systemctl enable nats-server
systemctl restart nats-server

