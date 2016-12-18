#!/bin/sh
source ~/dotfiles/setup/functions.sh

fancy_echo "Installing Atom"
ln -s ~/dotfiles/atom ~/.atom
brew cask install atom

fancy_echo "Installing Atom packages"
apm install atom-keyboard-macros-vim
apm install autocomplete-modules
apm install autocomplete-paths
apm install color-picker
apm install editorconfig
apm install file-icons
apm install fonts
apm install language-babel
apm install linter
apm install linter-eslint
apm install merge-conflicts
apm install pigments
apm install relative-numbers
apm install vim-mode
apm install vim-surround
