WORKSPACE=/data/bsc-deploy
mkdir -p $WORKSPACE
Fullnode_PATH=/data/server1/data-seed


cd /data
git clone https://github.com/bnb-chain/bsc.git
cd ./bsc
git checkout master
make geth
cp ./build/bin/geth /usr/local/bin/bsc
echo "Finish bsc binary generation"

# config.toml genesis.json
cp ~/bsc-fast-deploy/fastnode-config/*  $WORKSPACE/

# auto start
cp ~/bsc-fast-deploy/fullnode-config/bsc.service /etc/systemd/system/
systemctl daemon-reload
chmod +x $WORKSPACE/chaind.sh

# mv snapshot
mkdir -p $WORKSPACE/node

# init
echo "init node"
bsc --datadir $WORKSPACE/node init $WORKSPACE/genesis.json
echo "init finished, start backup $WORKSPACE"



