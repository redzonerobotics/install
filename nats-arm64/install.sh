#!/bin/bash

{
echo "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# Remove any previous installation is present
sudo rm /usr/share/nats/nats.conf
sudo rm /usr/local/bin/nats-server
sudo rm /etc/systemd/system/nats-server.service
sudo rm /etc/systemd/system/multi-user.target.wants/nats-server.service
} &> /dev/null

wget https://github.com/nats-io/nats-server/releases/download/v2.1.8/nats-server-v2.1.8-arm64.deb
dpkg -i nats-server-v2.1.8-arm64.deb
rm nats-server-v2.1.8-arm64.deb

wget https://raw.githubusercontent.com/redzonerobotics/install/master/nats-arm64/nats.conf
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

