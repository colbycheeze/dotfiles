#!/bin/sh

if ! command -v brew >/dev/null; then
 fancy_echo "Installing Homebrew ..."
   curl -fsS \
     'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

   append_to_zshrc '# recommended by brew doctor'

   # shellcheck disable=SC2016
   append_to_zshrc 'export PATH="/usr/local/bin:$PATH"' 1

   export PATH="/usr/local/bin:$PATH"
fi

if brew list | grep -Fq brew-cask; then
 fancy_echo "Uninstalling old Homebrew-Cask ..."
 brew uninstall --force brew-cask
fi

fancy_echo "Installing apps with Homebrew ..."
brew install openssl
brew install zsh
brew install bash
brew install bash-completion
brew install fzf
brew install the_silver_searcher
brew install wget

fancy_echo "Setting up tmux"
brew install tmux
brew install reattach-to-user-namespace
brew install tree
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

fancy_echo "Installing python and setting up Neovim"
brew install python
brew install python3
brew install neovim/neovim/neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim

brew install chrome-cli
brew install git
brew install hub
brew install redis
brew install postgresql
brew install rbenv
brew install ruby-build
brew install heroku
brew tap cloudfoundry/tap
brew install cf-cli
# if permissions get set to root on ~/.cf, just run `sudo chown <username> -R ~/.cf/`

brew tap caskroom/cask
brew cask install mongodb
brew cask install google-chrome
brew cask install iterm2
brew cask install github-desktop
brew cask install dropbox
brew cask install cloud
brew cask install divvy
brew cask install karabiner
brew cask install skype
brew cask install seil
brew cask install caffeine
brew cask install balsamiq-mockups
brew cask install screenflow
brew cask install zoomus
brew cask install postman
brew cask install bluemix-cli

fancy_echo "Installing Misc Apps"
brew cask install discord
brew cask install slack
brew cask install disk-inventory-x
brew cask install vlc
brew cask install spotify
brew cask install steam
brew cask install kindle

fancy_echo "Setting up Node with NVM"
brew install nvm
mkdir ~/.nvm
source setup/shell.sh
nvm install node
nvm alias default node

fancy_echo "Installing global npm packages"
npm install -g npm@latest
npm install -g redux-cli gulp create-react-app npm-check-updates babel-cli bower browser-sync
