# 1. git, golang, gcc, zsh, oh-my-zsh, aria2
apt-get update
apt-get install -y git gcc zsh aria2 make net-tools tmux
apt-get -y install liblz4-tool

# 3. install nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
apt-get install nodejs -y
npm install yarn pm2 -g

# Caution: if amd64 use this
# wget https://go.dev/dl/go1.18.linux-amd64.tar.gz
# rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
wget https://go.dev/dl/go1.18.linux-arm64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-arm64.tar.gz


# 2. set zsh to default and install oh-my-zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
