docker run -d \
  --name xmrig \
  --cap-add=IPC_LOCK \
  -v /workspaces/temp/config.json:/home/miner/config/config.json \
  xmrig:6.25.0