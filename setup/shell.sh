#!/bin/sh
source ~/dotfiles/setup/functions.sh

fancy_echo "Setting up Node with NVM"
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install node
nvm alias default node

fancy_echo "Installing global npm packages"
npm install -g npm@latest
npm install -g npm-check-updates browser-sync

fancy_echo "Installing Yarn"
Brew install zsh
brew install yarn
export PATH="$PATH:`yarn global bin`"

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
 mkdir "$HOME/.bin"
fi

if [ ! -f "$HOME/.zshrc" ]; then
 touch "$HOME/.zshrc"
fi

# shellcheck disable=SC2016
append_to_zshrc 'export PATH="$HOME/.bin:$PATH"'

HOMEBREW_PREFIX="/usr/local"

if [ -d "$HOMEBREW_PREFIX" ]; then
 if ! [ -r "$HOMEBREW_PREFIX" ]; then
   sudo chown -R "$LOGNAME:admin" /usr/local
 fi
else
 sudo mkdir "$HOMEBREW_PREFIX"
 sudo chflags norestricted "$HOMEBREW_PREFIX"
 sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

brew uninstall zsh
case "$SHELL" in
 */zsh) : ;;
 *)
   fancy_echo "Changing your shell to zsh ..."
     chsh -s "$(which zsh)"
   ;;
esac

curl -L https://iterm2.com/misc/install_shell_integration_and_utilities.sh | bash

git clone git@github.com:powerline/fonts.git ~/fonts-delete && ~/fonts-delete/install.sh && rm -rf ~/fonts-delete

