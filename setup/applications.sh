#!/bin/sh
source ~/dotfiles/setup/functions.sh

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

brew update && brew install `brew outdated`

fancy_echo "Installing CLI tools"
brew install openssl
brew install zsh
brew install zsh-completions
brew install bash
brew install bash-completion
brew install fzf
brew install the_silver_searcher
brew install wget
brew install watchman # needed for jest --watch

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
brew install rbenv
brew install ruby-build
brew install imagemagick

brew install postgresql
brew services start postgresql
brew install redis
brew services start redis

brew tap caskroom/cask
brew cask install mongodb
brew cask install google-chrome
brew cask install iterm2
brew cask install github-desktop
brew cask install dropbox
brew cask install divvy
brew cask install caffeine
brew cask install balsamiq-mockups
brew cask install screenflow
brew cask install postman
brew cask install macdown
brew cask install unison

fancy_echo "Installing Misc Apps"
brew cask install discord
brew cask install slack
brew cask install disk-inventory-x
brew cask install vlc

fancy_echo "Please open ITerm2 and continue by running ./setup.sh"
