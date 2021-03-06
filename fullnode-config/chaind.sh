#!/bin/bash

export GOGC=200

function startChaind() {
#    ip=`ifconfig eth0|grep inet|grep -v inet6 |awk '{ print $2 }'`
    workspace=/data/bsc-deploy
#    sed -i -e "s?FileRoot = \"\"?FileRoot = \"/mnt/efs/data-seed/${ip}/\"?g" /data/data-seed/config.toml
    mkdir -p /data/bsc-deploy/logs


    # 1. consider --syncmode=full
    # 2. consider --cache= 1/3 * all free memory
    # 3. --allow-insecure-no-tries only for v1.1.7
    bsc --config /data/bsc-deploy/config.toml --datadir /data/bsc-deploy/node \
    --syncmode full  --cache 8000 \
    --rpc.allow-unprotected-txs \
    --rpc.gascap 30000000 --rpc.txfeecap 2  \
    --ws --ws.port 8546 --ws.api eth,net,web3,txpool \
    >> /data/bsc-deploy/logs/bscnode.log 2>&1 &
}

function stopChaind() {
    pid=`ps -ef | grep /data/bsc-deploy/node | grep -v grep | awk '{print $2}'`
    if [ -n "$pid" ]; then
        for((i=1;i<=4;i++));
        do
            kill $pid
            sleep 5
            pid=`ps -ef | grep /data/bsc-deploy/node | grep -v grep | awk '{print $2}'`
            if [ -z "$pid" ]; then
                break
            elif [ $i -eq 4 ]; then
                kill -9 $pid
            fi
        done
    fi
}

CMD=$1

case $CMD in
-start)
    echo "start"
    startChaind
    ;;
-stop)
    echo "stop"
    stopChaind
    ;;
-restart)
    stopChaind
    sleep 3
    startChaind
    ;;
*)
    echo "Usage: chaind.sh -start | -stop | -restart .Or use systemctl start | stop | restart bsc.service "
    ;;
esac
