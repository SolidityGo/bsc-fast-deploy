WORKSPACE=/data/bsc-deploy
Fastnode_PATH=/data/server/data-seed


tmux new -s bsc

cd /data && \
aria2c -o geth.tar.lz4 -x 4 -s 12 \
https://tf-dex-prod-public-snapshot-site1.s3-accelerate.amazonaws.com/geth-20220403.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=aXdK0jPtdRihyj1vaX%2Ffwq340%2BE%3D&Expires=1651655212 \
https://tf-dex-prod-public-snapshot.s3-accelerate.amazonaws.com/geth-20220403.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=AXwfbVPYr4gDFUXcdAoFJBE3Ad4%3D&Expires=1651655213 \
https://tf-dex-prod-public-snapshot-site3.s3-accelerate.amazonaws.com/geth-20220403.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=U2y2CtRjbkdX4b9%2BmTYRFNd0U3I%3D&Expires=1651655213 \
&&  tar -I lz4 -xvf ./geth.tar.lz4 && echo "---------lz4 Finished---------"

# init
echo "init node"
bsc --datadir $WORKSPACE/node init $WORKSPACE/genesis.json
echo "init finished, start backup $WORKSPACE"
mv $WORKSPACE/node/geth/chaindata $WORKSPACE/chaindata.bak
echo "backup $WORKSPACE finished, start mv snapshot"
mv  $Fastnode_PATH/geth/chaindata $WORKSPACE/node/geth/
mv  $Fastnode_PATH/geth/triecache $WORKSPACE/node/geth/triecache
echo "Completed mv snapshot !"


# tmux attach -t  download

