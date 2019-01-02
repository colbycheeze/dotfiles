#!/bin/bash
source ~/dotfiles/setup/functions.sh

dotfiles=(
zsh
bin
aliases
agignore
gitconfig
gitconfig.local
gitmessage
gvimrc
tmux.conf
zshenv
zshrc
vimrc.bundles
vimrc
vim
)

autostart=(
dropboxd.desktop
guake.desktop
pygrid.desktop
)

nvimrcpath="$HOME/.config/nvim/init.vim"
nvimpath="$HOME/.config/nvimrc"

fancy_echo "Backup current config"
today=`date +%Y%m%d`
for i in ${dotfiles[@]} ; do
  if [ "vimrc" == "$i" ]; then
    [ -e $nvimrcpath ] && [ ! -L $nvimrcpath ] && mv $nvimrcpath $nvimrcpath.bak.$today ;
    [ -L $nvimrcpath ] && unlink $nvimrcpath ;
  elif [ "vim" == "$i" ]; then
    [ -e $nvimpath ] && [ ! -L $nvimpath ] && mv $nvimpath $nvimpath.bak.$today ;
    [ -L $nvimpath ] && unlink $nvimpath ;
  else
    [ -e $HOME/.$i ] && [ ! -L $HOME/.$i ] && mv $HOME/.$i $HOME/.$i.bak.$today ;
    [ -L $HOME/.$i ] && unlink $HOME/.$i ;
  fi
done
for i in ${autostart[@]} ; do
  [ -e $HOME/.config/autostart/$i ] && [ ! -L $HOME/.config/autostart/$i ] && mv $HOME/.config/autostart/$i $HOME/.config/autostart/$i.bak.$today ;
  [ -L $HOME/.config/autostart/$i ] && unlink $HOME/.config/autostart/$i ;
done

fancy_echo "Symlinking dotfiles"
for i in ${dotfiles[@]} ; do
  if [ "vimrc" == "$i" ]; then
    ln -s $HOME/dotfiles/vimrc $nvimrcpath
  elif [ "vim" == "$i" ]; then
    ln -s $HOME/.vim $nvimpath
  else
    ln -s $HOME/dotfiles/$i ~/.$i
  fi
done
for i in ${autostart[@]} ; do
  ln -s $HOME/dotfiles/autostart/$i $HOME/.config/autostart/$i
done
