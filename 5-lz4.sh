#lz4 -d ./geth.tar.lz4 | tar -xvf -
cd /data
tar -I lz4 -xvf ./geth.tar.lz4
