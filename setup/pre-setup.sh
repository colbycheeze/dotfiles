#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

fancy_echo "Installing git, guake, and xsel ..."
sudo apt -y install git xsel guake

fancy_echo "Setting up Github SSH access."
echo "Enter your Github email."
read git_email

fancy_echo "Creating Git and Github SSH key pairs."
ssh-keygen -t rsa -b 4096 -C $git_email

fancy_echo "Starting ssh-agent in the background."
eval "$(ssh-agent -s)"

fancy_echo "Adding your SSH key to ssh-agent."
ssh-add ~/.ssh/id_rsa

fancy_echo "Copying SSH key to your clipboard."
xsel -b -i < ~/.ssh/id_rsa.pub

fancy_echo "Add key to github to finish setup."
echo "Press enter to open instructions."
read throwaway_input
xdg-open https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
xdg-open https://github.com/settings/keys
