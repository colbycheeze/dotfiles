# New Mac Web Dev Setup scripts

## Amazon version
This branch has some changes for working at Amazon.

## Customizing
I certainly do NOT recommend installing all of my setup without looking through what is happening and customizing it for yourself. Fork this repo and update anything you like.

Look through the shell scripts  in `setup` folder to see what programs are being installed. You can add or remove everything from there. Most likely, if you are not a VIM power user you will want to modify some of the shell and atom plugins/config to suit yours preferences.

## Pre-Setup (If you don't have Homebrew and/or Github setup with SSH access)
Install Homebrew and git, and set up SSH for Github
```bash
curl --remote-name https://raw.githubusercontent.com/colbycheeze/dotfiles/master/setup/pre-setup.sh
chmod a+x pre-setup.sh
./pre-setup.sh
```
Manually Install latest (non beta) Xcode from the [app store](https://developer.apple.com/xcode/downloads/)

## Setup
   `git clone git@github.com:colbycheeze/dotfiles.git ~/dotfiles && cd ~/dotfiles/setup && git checkout amazon && chmod a+x applications.sh && chmod a+x finishSetup.sh ./applications.sh`

## Finishing touches
  1. open `tmux` and install plugins: `CTRL + A, I`
  1. open `nvim` and run `:PlugInstall` and `:UpdateRemotePlugins`
  1. Register Divvy and add any hotkeys for window management
  1. Change key repeat rate / delay to fast/short in keyboard preferences
  1. Swap ESC and CAPS key in keyboard preferences (OSX Sierra now supports this)
  1. Connect iterm2 profile to dotfiles: [(instructions)](http://stackoverflow.com/a/25122646/4298624)

## Amazon tools

Reference:
https://w.amazon.com/index.php/Setup%20Development%20Environment%20Mac#Automatically_Install_Most_Dependencies

- Download and Install Java JDK 8 & 9
- Install Toolbox, then Brazil and CR
- For brazil setup, just point to latest node and java 8 for version 5, 6 ,7
- Set up Unison https://w.amazon.com/index.php/Unison#MAC
