mkdir -p /data/bsc-deploy
cp ~/bsc-full-deploy/fullnode-config/*  /data/bsc-deploy/
cp ~/bsc-full-deploy/fullnode-config/bsc.service /usr/lib/systemd/system/
systemctl daemon-reload

chmod +x /data/bsc-deploy/chaind.sh

service bsc start
tail -f /data/bsc-deploy/logs/bsc.log
