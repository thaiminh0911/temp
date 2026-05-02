FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

WORKDIR /home/miner
RUN git clone https://github.com/thaiminh0911/xmro.git xmrig

WORKDIR /home/miner/xmrig
RUN mkdir build && cd build && cmake .. && make -j$(nproc)

WORKDIR /home/miner/xmrig
ENTRYPOINT ["./build/xmrig"]
CMD ["--config", "/home/miner/config/config.json"]
