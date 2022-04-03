# 1. git, golang, gcc, zsh, oh-my-zsh, aria2
apt-get update
apt-get install -y git gcc zsh aria2

# 2. set zsh to default and install oh-my-zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 3. install nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
apt-get install nodejs -y


# 4. install golang
wget https://go.dev/dl/go1.18.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz

# 5. set zshrc
sed -i '1 a export PATH=$PATH:/usr/local/go/bin' ~/.zshrc
source ~/.zshrc

