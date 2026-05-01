#!/bin/bash

# Try to enable hugepages (Codespaces may ignore this silently)
sysctl -w vm.nr_hugepages=4096 || true

# Run XMRig directly with your config
/home/miner/xmrig/build/xmrig --config /workspaces/temp/config.json
