#!/bin/bash
source ~/dotfiles/setup/functions.sh

fancy_echo "Installing Python and related setup tools."
sudo apt-get install -y python python-dev python-pip python3 python3-gi python3-xlib python3-dev python3-pip
sudo apt-get install -y software-properties-common

fancy_echo "Installing CLI tools"
sudo apt install -y curl tree bash
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_18.10/ /' > /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9CBE063CAB8FE1F1
sudo apt-get update
sudo apt install -y bash-completion silversearcher-ag

fancy_echo "Installing Neovim"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone git@github.com:powerline/fonts.git ~/powerline-fonts && ~/powerline-fonts/install.sh && rm -rf ~/powerline-fonts

fancy_echo "Setting up tmux"
sudo apt install -y tmux reattach-to-user-namespace
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

fancy_echo "Setting up Node with NVM"
mkdir ~/.nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
nvm alias default node

fancy_echo "Installing global npm packages"
npm install -g npm@latest
npm install -g npm-check-updates browser-sync

fancy_echo "installing Misc Apps"
sudo apt install -y gnome-tweak-tool # For swapping esc and caps
sudo apt install -y libgconf-2-4 # needed for postman
sudo snap install -y postman
sudo snap install -y discord
sudo snap install -y slack --classic
sudo snap install -y vlc
sudo snap install -y gitkraken

cd ~
git clone https://github.com/mjs7231/pygrid.git
cd pygrid && ./pygrid.py
cd ~/dotfiles

fancy_echo "installing Google Chrome."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads/
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
rm ~/Downloads/google-chrome-stable_current_amd64.deb

fancy_echo "installing Dropbox."
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2018.11.28_amd64.deb -P ~/Downloads/
sudo dpkg -i ~/Downloads/dropbox_2018.11.28_amd64.deb
rm ~/Downloads/dropbox_2018.11.28_amd64.deb
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
cd ~/dotfiles
