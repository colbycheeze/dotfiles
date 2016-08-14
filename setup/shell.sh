#!/bin/sh

shellcheck disable=SC2154
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

case "$SHELL" in
 */zsh) : ;;
 *)
   fancy_echo "Changing your shell to zsh ..."
     chsh -s "$(which zsh)"
   ;;
esac
