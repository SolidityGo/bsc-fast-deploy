
WORKSPACE=/data/bsc-deploy
Fastnode_PATH=/data/server/data-seed

cd /data && \
aria2c -o geth.tar.lz4 -x 4 -s 12 \
https://tf-dex-prod-public-snapshot-site1.s3-accelerate.amazonaws.com/geth-20220407.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=JrKjBz%2F5UHShZH90hUjf%2BMTID5U%3D&Expires=1652004785 \
https://tf-dex-prod-public-snapshot.s3-accelerate.amazonaws.com/geth-20220407.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=TTL94Pmvf3uF35pzZcpCc1C4aiY%3D&Expires=1652004786 \
https://tf-dex-prod-public-snapshot-site3.s3-accelerate.amazonaws.com/geth-20220407.tar.lz4?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Signature=bW5bzzXNmMyZHjOYSf0sB9isqGc%3D&Expires=1652004786 \
&&  tar -I lz4 -xvf ./geth.tar.lz4 && echo "---------lz4 Finished---------"

# init
echo "init node"
bsc --datadir $WORKSPACE/node init $WORKSPACE/genesis.json
echo "init finished, start backup $WORKSPACE"
mv $WORKSPACE/node/geth/chaindata $WORKSPACE/chaindata.bak
echo "backup $WORKSPACE finished, start mv snapshot"
mv  $Fastnode_PATH/geth/chaindata $WORKSPACE/node/geth/
mv  $Fastnode_PATH/geth/triecache $WORKSPACE/node/geth/
echo "Completed mv snapshot !"


# tmux attach -t  download

