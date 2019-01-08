#!/bin/bash
source ~/dotfiles/setup/functions.sh

fancy_echo "Setting up git user info for .gitconfig.local"
echo "Enter your git name."
read git_name
echo "Enter your Github email."
read git_email
echo "Enter your Github username."
read github_username

touch ~/dotfiles/gitconfig.local
echo "[user]" >> ~/dotfiles/gitconfig.local
echo "  name = $git_name" >> ~/dotfiles/gitconfig.local
echo "  email = $git_email" >> ~/dotfiles/gitconfig.local
echo "[github]" >> ~/dotfiles/gitconfig.local
echo "  user = $github_username" >> ~/dotfiles/gitconfig.local

fancy_echo "Setting key delay and repeat rates."
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 35
gsettings set org.gnome.desktop.peripherals.keyboard delay 200

fancy_echo "Upping max file watchers."
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

source ~/dotfiles/setup/shell.sh
source ~/dotfiles/setup/applications.sh
source ~/dotfiles/setup/dotfiles.sh
source ~/dotfiles/setup/atom.sh
