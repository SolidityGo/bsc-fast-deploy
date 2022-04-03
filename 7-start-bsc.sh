mkdir -p /data/bsc-deploy
cp ~/bsc-fast-deploy/config/*  /data/bsc-deploy/
cp ~/bsc-fast-deploy/config/bsc.service /usr/lib/systemd/system/
systemctl daemon-reload

chmod +x /data/bsc-deploy/chaind.sh

service bsc start
tail -f /data/bsc-deploy/logs/bsc.log
