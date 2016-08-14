#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

if ! command -v brew >/dev/null; then
 fancy_echo "Installing Homebrew ..."
   curl -fsS \
     'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

   append_to_zshrc '# recommended by brew doctor'

   # shellcheck disable=SC2016
   append_to_zshrc 'export PATH="/usr/local/bin:$PATH"' 1

   export PATH="/usr/local/bin:$PATH"
fi

if brew list | grep -Fq brew-cask; then
 fancy_echo "Uninstalling old Homebrew-Cask ..."
 brew uninstall --force brew-cask
fi

fancy_echo "Installing git with Homebrew ..."
brew install git
brew tap caskroom/cask
brew cask install github-desktop

fancy_echo "Setting up Github SSH key pairs."
echo "Please enter your github email."
read github_email
ssh-keygen -t rsa -b 4096 -C $github_email

fancy_echo "Starting ssh-agent in the background."
eval "$(ssh-agent -s)"

fancy_echo "Adding your SSH key to ssh-agent."
ssh-add ~/.ssh/id_rsa

fancy_echo "Copying SSH key to your clipboard."
pbcopy < ~/.ssh/id_rsa.pub

fancy_echo "Add key to github to finish setup."
echo "Press enter to open instructions."
read throwaway_input
open https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
