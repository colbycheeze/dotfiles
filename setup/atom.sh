#!/bin/sh
source ~/dotfiles/setup/functions.sh

fancy_echo "Installing Atom"
ln -s ~/dotfiles/atom ~/.atom
brew cask install atom

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

fancy_echo "Installing atom packages for vim mode"
apm install relative-numbers
apm install atom-keyboard-macros-vim
apm install vim-mode-plus
apm install vim-mode-plus-keymaps-for-surround

fancy_echo "Installing atom packages for Amazon dev stuff"
apm install autocomplete-jsp

mkdir ~/tlds
wget -P ~/tlds https://raw.githubusercontent.com/javaee/jstl-api/master/impl/src/main/resources/META-INF/c.tld
wget -P ~/tlds https://raw.githubusercontent.com/javaee/jstl-api/master/impl/src/main/resources/META-INF/fmt.tld
wget -P ~/tlds https://raw.githubusercontent.com/javaee/jstl-api/master/impl/src/main/resources/META-INF/fn.tld
wget -P ~/tlds https://raw.githubusercontent.com/javaee/jstl-api/master/impl/src/main/resources/META-INF/sql.tld
wget -P ~/tlds https://raw.githubusercontent.com/javaee/jstl-api/master/impl/src/main/resources/META-INF/x.tld
