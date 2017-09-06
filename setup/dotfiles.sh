#!/bin/sh
source ~/dotfiles/setup/functions.sh


dotfiles=(
zsh
bin
aliases
agignore
gitconfig
gitmessage
gvimrc
tmux.conf
zshenv
zshrc
vimrc.bundles
vimrc
vim
)

nvimrcpath="~/.config/nvim/init.vim"
nvimpath="~/.config/nvimrc"

fancy_echo "Backup current config"
today=`date +%Y%m%d`
for i in ${dotfiles[@]} ; do
  if [ "vimrc" == "$i" ]; then
    [ -e $nvimrcpath ] && [ ! -L $nvimrcpath ] && mv $nvimrcpath $nvimrcpath.bak.$today ;
    [ -L $nvimrcpath ] && unlink $nvimrcpath ;
  elif [ "vim" == "$i" ]; then
    [ -e ~$nvimpath ] && [ ! -L ~$nvimpath ] && mv ~$nvimpath ~$nvimpath.bak.$today ;
    [ -L ~$nvimpath ] && unlink ~$nvimpath ;
  else
    [ -e ~/.$i ] && [ ! -L ~/.$i ] && mv ~/.$i ~/.$i.bak.$today ;
    [ -L ~/.$i ] && unlink ~/.$i ;
  fi

done

fancy_echo "Symlinking dotfiles"
for i in ${dotfiles[@]} ; do
  if [ "vimrc" == "$i" ]; then
    ln -s ~/dotfiles/vimrc $nvimrcpath
  elif [ "vim" == "$i" ]; then
    ln -s ~/.vim $nvimpath
  else
    ln -s ~/dotfiles/$i ~/.$i
  fi
done

