# New Linux (Ubuntu) Web Dev Setup scripts

## Current as of Ubuntu 18.10
This branch has changes for setting up a Linux env.

## Customizing
I do NOT recommend installing all of my setup without looking through what is happening and customizing it for yourself. Fork this repo and update anything you like.

Look through the shell scripts  in `setup` folder to see what programs are being installed. You can add or remove everything from there. Most likely, if you are not a VIM power user you will want to modify some of the shell and atom plugins/config to suit yours preferences.

## Pre-Setup (If you don't have Github setup with SSH access)
Install git, and set up SSH for Github
```bash
curl --remote-name https://raw.githubusercontent.com/colbycheeze/dotfiles/master/setup/pre-setup.sh
chmod a+x pre-setup.sh
./pre-setup.sh
```

## Setup
   `git clone git@github.com:colbycheeze/dotfiles.git ~/dotfiles && cd ~/dotfiles/setup && git checkout linux-ubuntu && chmod a+x setup.sh && ./setup.sh`

## Finishing touches
  1. open `tmux` and install plugins: `CTRL + A, I`
  1. open `nvim` and run `:PlugInstall` and `:UpdateRemotePlugins`
  1. Swap ESC and CAPS key in Tweaks > Keyboard & Mouse > Additional Layout Options > Caps Lock behavior
