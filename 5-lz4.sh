#lz4 -d ./geth.tar.lz4 | tar -xvf -
cd /data
nohup tar -I lz4 -xvf ./geth.tar.lz4 &
