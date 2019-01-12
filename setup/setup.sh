#!/bin/sh
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

source ~/dotfiles/setup/shell.sh
source ~/dotfiles/setup/applications.sh
source ~/dotfiles/setup/dotfiles.sh
source ~/dotfiles/setup/atom.sh
source ~/dotfiles/setup/vscode.sh
source ~/dotfiles/setup/osxsettings.sh
