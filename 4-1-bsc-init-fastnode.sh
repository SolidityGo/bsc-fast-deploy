WORKSPACE=/data/bsc-deploy
mkdir -p $WORKSPACE
Fastnode_PATH=/data/server/data-seed


cd /data
git clone https://github.com/realuncle/bsc.git
cd ./bsc
git checkout fastnode
make geth
cp ./build/bin/geth /usr/local/bin/bsc
echo "Finish bsc binary generation"

# config.toml genesis.json
cp ~/bsc-fast-deploy/fastnode-config/*  $WORKSPACE/

# auto start
cp ~/bsc-fast-deploy/fastnode-config/bsc.service /etc/systemd/system/
systemctl daemon-reload
chmod +x $WORKSPACE/chaind.sh

# mv snapshot
mkdir -p $WORKSPACE/node

# init
echo "init node"
bsc --datadir $WORKSPACE/node init $WORKSPACE/genesis.json
echo "init finished, start backup $WORKSPACE"

