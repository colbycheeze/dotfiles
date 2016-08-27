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
brew install wget
brew install openssl
brew install node
brew install tmux
brew install reattach-to-user-namespace
brew install tree
brew install python
brew install python3
brew install neovim/neovim/neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim

brew install chrome-cli
brew install redis
brew install the_silver_searcher
brew install fzf
brew install git
brew install hub
brew install zsh
brew install postgresql
brew install bash
brew install bash-completion
brew install rbenv
brew install ruby-build
brew install heroku
brew tap cloudfoundry/tap
brew install cf-cli

brew tap caskroom/cask
brew cask install mongodb
brew cask install google-chrome
brew cask install dropbox
brew cask install iterm2
brew cask install disk-inventory-x
brew cask install github-desktop
brew cask install cloud
brew cask install discord
brew cask install slack
brew cask install divvy
brew cask install karabiner
brew cask install vlc
brew cask install skype
brew cask install seil
brew cask install caffeine
brew cask install balsamiq-mockups
brew cask install screenflow
brew cask install zoomus
brew cask install bluemix-cli

fancy_echo "Installing Misc Apps"
brew cask install spotify
brew cask install steam
brew cask install kindle

fancy_echo "installing global npm packages"
npm install -g redux-cli gulp create-react-app npm-check-updates babel-cli bower browser-sync
