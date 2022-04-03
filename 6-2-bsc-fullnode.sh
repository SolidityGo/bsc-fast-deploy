cd /data
git clone https://github.com/bnb-chain/bsc.git
cd ./bsc
git checkout master
make geth
cp ./build/bin/geth /usr/local/bin/bsc
