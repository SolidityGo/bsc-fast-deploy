WORKSPACE=/data/bsc-deploy
Fastnode_PATH=/data/server/data-seed


tmux new -s bsc

cd /data && \
aria2c -o geth.tar.lz4 -x 4 -s 12 \
https://tf-dex-prod-public-snapshot-site1.s3-accelerate.amazonaws.com/geth-20220401.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=Sd4bS%2Ff%2BY6LzrV00Y%2BrhihCDgqs%3D&Expires=1651482430 \
https://tf-dex-prod-public-snapshot.s3-accelerate.amazonaws.com/geth-20220401.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=3Hy1DF5x%2BqkUpQQb0m6GdVV4F%2Bk%3D&Expires=1651482430 \
https://tf-dex-prod-public-snapshot-site3.s3-accelerate.amazonaws.com/geth-20220401.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=A2MJz%2BkBYbath%2BtNrhcNNoeHxDA%3D&Expires=1651482430 \
&&  tar -I lz4 -xvf ./geth.tar.lz4

# init
echo "init node"
bsc --datadir $WORKSPACE/node init $WORKSPACE/genesis.json
echo "init finished, start backup $WORKSPACE"
mv $WORKSPACE/node/geth/chaindata $WORKSPACE/node/geth/chaindata.bak
echo "backup $WORKSPACE finished, start mv snapshot"
mv  $Fastnode_PATH/geth/chaindata $WORKSPACE/node/geth/chaindata
mv  $Fastnode_PATH/geth/triecache $WORKSPACE/node/geth/triecache
echo "Completed mv snapshot !"


# tmux attach -t  download

