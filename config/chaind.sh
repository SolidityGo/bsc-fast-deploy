#!/bin/bash

export GOGC=200

function startChaind() {
    ip=`ifconfig eth0|grep inet|grep -v inet6 |awk '{ print $2 }'`
    workspace=/data/bsc-deploy
#    sed -i -e "s?FileRoot = \"\"?FileRoot = \"/mnt/efs/data-seed/${ip}/\"?g" /data/data-seed/config.toml
    mkdir -p /mnt/efs/data-seed/${ip}

    bsc --config ./config.toml --datadir /data/server/data-seed \
    --syncmode fast  --cache 4000 \
    --rpc.allow-unprotected-txs \
    --allow-insecure-no-tries \
    --rpc.gascap 70000000 --rpc.txfeecap 10  \
    --ws --ws.port 8546 --ws.api eth,net,web3,txpool \
    >> /mnt/efs/data-seed/${ip}/bscnode.log 2>&1 &
}

function stopChaind() {
    pid=`ps -ef | grep /data/data-seed/bsc | grep -v grep | awk '{print $2}'`
    if [ -n "$pid" ]; then
        for((i=1;i<=4;i++));
        do
            kill $pid
            sleep 5
            pid=`ps -ef | grep /data/data-seed/bsc | grep -v grep | awk '{print $2}'`
            if [ -z "$pid" ]; then
                break
            elif [ $i -eq 4 ]; then
                kill -9 $kid
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