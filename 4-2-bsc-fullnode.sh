cd /data
git clone https://github.com/bnb-chain/bsc.git
cd ./bsc
git checkout master
make geth
cp ./build/bin/geth /usr/local/bin/bsc

mkdir -p /data/bsc-deploy
cp ~/bsc-fast-deploy/fullnode-config/*  /data/bsc-deploy/
cp ~/bsc-fast-deploy/fullnode-config/bsc.service /etc/systemd/system/
systemctl daemon-reload

chmod +x /data/bsc-deploy/chaind.sh


