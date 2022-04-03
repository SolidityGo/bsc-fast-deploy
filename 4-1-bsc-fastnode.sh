cd /data
git clone https://github.com/realuncle/bsc.git
cd ./bsc
git checkout fastnode
make geth
cp ./build/bin/geth /usr/local/bin/bsc

mkdir -p /data/bsc-deploy
cp ~/bsc-fast-deploy/fastnode-config/*  /data/bsc-deploy/
cp ~/bsc-fast-deploy/fastnode-config/bsc.service /etc/systemd/system/
systemctl daemon-reload

chmod +x /data/bsc-deploy/chaind.sh

