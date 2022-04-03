cd /data
git clone https://github.com/realuncle/bsc.git
cd ./bsc
git checkout fastnode
make geth
cp ./build/bin/geth /usr/local/bin/
