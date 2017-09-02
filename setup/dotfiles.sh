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
# for i in ; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
# for i in $HOME/.vim $HOME/.vimrc; do [ -L $i ] && unlink $i ; done
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


# deprecated

# TODO: Currently these will nest if a link exists, so add check
# http://stackoverflow.com/questions/5767062/how-to-check-if-symlink-exists
# ln -s ~/dotfiles/zsh ~/.zsh
# ln -s ~/dotfiles/bin ~/.bin
# ln -s ~/dotfiles/aliases ~/.aliases
# ln -s ~/dotfiles/agignore ~/.agignore
# ln -s ~/dotfiles/gitconfig ~/.gitconfig
# ln -s ~/dotfiles/gitmessage ~/.gitmessage
# ln -s ~/dotfiles/gvimrc ~/.gvimrc
# ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
# ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
# ln -s ~/.vim ~/.config/nvimrc
# ln -s ~/dotfiles/vimrc.bundles ~/.vimrc.bundles
# ln -s ~/dotfiles/zshenv ~/.zshenv
# ln -s ~/dotfiles/zshrc ~/.zshrc
