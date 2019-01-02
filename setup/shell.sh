#!/bin/bash
source ~/dotfiles/setup/functions.sh

sudo apt install -y zsh

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

case "$SHELL" in
 */zsh) : ;;
 *)
   fancy_echo "Changing your shell to zsh ..."
     chsh -s "$(which zsh)"
   ;;
esac
