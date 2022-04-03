# 1. git, golang, gcc, zsh, oh-my-zsh, aria2
apt-get update
apt-get install -y git gcc zsh aria2 make


# 3. install nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
apt-get install nodejs -y
npm install yarn pm2 -g


# 2. set zsh to default and install oh-my-zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
