mkdir /data
mkfs -t ext4 /dev/nvme1n1

sed -i '$a  \/dev\/nvme1n1  \/data  ext4  defaults  0  2' /etc/fstab
mount /data
