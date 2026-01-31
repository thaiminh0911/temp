#!/bin/bash
sudo sysctl -w vm.nr_hugepages=4096
echo "vm.nr_hugepages=4096" | sudo tee -a /etc/sysctl.conf

docker build -t xmrig .

docker run -d \
  --name xmrig \
  --cap-add=IPC_LOCK \
  -v /workspaces/temp/config.json:/home/miner/config/config.json \
  xmrig:latest