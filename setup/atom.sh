#!/bin/bash
source ~/dotfiles/setup/functions.sh

fancy_echo "Installing Atom"
ln -s ~/dotfiles/atom ~/.atom
sudo snap install atom --classic

fancy_echo "Installing Atom packages"
apm install autocomplete-modules
apm install autocomplete-paths
apm install color-picker
apm install editorconfig
apm install file-icons
apm install fonts
apm install language-babel
apm install linter
apm install linter-eslint
apm install pigments
apm install gist
apm install language-hjson

fancy_echo "Installing atom packages for vim mode"
apm install relative-numbers
apm install atom-keyboard-macros-vim
apm install vim-mode-plus
apm install vim-mode-plus-keymaps-for-surround
