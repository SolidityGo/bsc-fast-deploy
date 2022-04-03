# 1. git, golang, gcc, zsh, oh-my-zsh, aria2
yum update
yum install -y git gcc zsh  make net-tools util-linux-user
rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y aria2

# 3. install nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
yum install nodejs -y
npm install yarn pm2 -g

wget https://go.dev/dl/go1.18.linux-arm64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-arm64.tar.gz

# 2. set zsh to default and install oh-my-zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
