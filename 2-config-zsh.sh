# 0. download zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# 1. install golang
sed -i '1 a export PATH=$PATH:/usr/local/go/bin' ~/.zshrc

# 2. set bira theme
#  > ~/.zshrc.tmp
sed -i "s/ZSH_THEME=.*/ZSH_THEME=\"bira\"/" ~/.zshrc
sed -i "s/^plugins=(.*)$/plugins=( \n git z copypath copyfile copybuffer jsontools history \n zsh-autosuggestions \n zsh-syntax-highlighting \n zsh-history-substring-search \n)/" ~/.zshrc

# 3. source
source ~/.zshrc

# parted data disk
cgdisk /dev/nvme1n1

