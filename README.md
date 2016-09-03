# New Mac Web Dev Setup scripts

## Pre-Setup (If you don't have homebrew and/or Github setup with SSH access)
Install homebrew and git, and set up SSH for Github
```bash
curl --remote-name https://raw.githubusercontent.com/colbycheeze/dotfiles/master/setup/pre-setup.sh
less mac
sh mac 2>&1 | tee ~/laptop.log
```
Install latest (non beta) Xcode from the [app store](https://developer.apple.com/xcode/downloads/)

## Setup
   `git clone git@github.com:colbycheeze/dotfiles.git ~/dotfiles && cd ~/dotfiles/setup && chmod a+x setup.sh && ./setup/setup.sh`

## Finishing touches
  1. open `tmux` and install plugins: `CTRL + A, I`
  1. open `nvim` and run `:PlugInstall` and `:UpdateRemotePlugins`
  1. Register Divvy and add any hotkeys for window management
  1. Change key repeat rate with karabiner (delay: 225, repeat: 25)
  1. Swap ESC and CAPS key with seil: [(instructions)](http://stackoverflow.com/a/8437594) or
     karabiner: [(instructions)](https://cl.ly/1841320I2H3V)
  1. Connect iterm2 profile to dotfiles: [(instructions)](http://stackoverflow.com/a/25122646/4298624)

## Customizing
I certainly do NOT recommend installing all of my setup without looking through what is happening and customizing it for yourself. Fork this repo and update anything you like.

Look through the shell scripts  in `setup` folder to see what programs are being installed. You can add or remove everything from there. Most likely, if you are not a VIM power user you will want to modify some of the shell and atom plugins/config to suit yours preferences.
