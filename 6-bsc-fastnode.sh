cd /data
git clone https://github.com/realuncle/bsc.git
cd ./bsc
git checkout fastnode
make geth
cp ./build/bin/geth /usr/local/bin/bsc

mkdir -p /data/bsc-deploy
cp ~/bsc-fast-deploy/config/*  /data/bsc-deploy/
cp ~/bsc-fast-deploy/config/bsc.service /usr/lib/systemd/system/
systemctl daemon-reload
