#!/bin/bash

# Enable hugepages
sudo sysctl -w vm.nr_hugepages=4096
echo "vm.nr_hugepages=4096" | sudo tee -a /etc/sysctl.conf

# Build image
docker build -t xmrig .

# Remove old container if exists
docker rm -f xmrig 2>/dev/null

# Run container
docker run -d \
  --name xmrig \
  --cap-add=IPC_LOCK \
  -v /workspaces/temp/config.json:/home/miner/config/config.json \
  xmrig:latest

# Show live logs
docker logs -f xmrig
