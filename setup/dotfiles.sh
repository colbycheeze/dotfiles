#!/bin/sh

# TODO: Currently these will nest if a link exists, so add check
# http://stackoverflow.com/questions/5767062/how-to-check-if-symlink-exists

fancy_echo "Symlinking dotfiles"
ln -s ~/dotfiles/zsh ~/.zsh
ln -s ~/dotfiles/bin ~/.bin
ln -s ~/dotfiles/aliases ~/.aliases
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitmessage ~/.gitmessage
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/tmux ~/.tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s ~/.vim ~/.config/nvimrc
ln -s ~/dotfiles/vimrc.bundles ~/.vimrc.bundles
ln -s ~/dotfiles/zshenv ~/.zshenv
ln -s ~/dotfiles/zshrc ~/.zshrc
