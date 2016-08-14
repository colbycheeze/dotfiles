# New Mac Web Dev Setup scripts

## Pre-Setup
  1. Install homebrew and git, and set up SSH for Github
```
curl --remote-name https://raw.githubusercontent.com/colbycheeze/dotfiles/master/setup/pre-setup.sh
less mac
sh mac 2>&1 | tee ~/laptop.log
```
  1. Install latest (non beta) Xcode from app store

## Setup
  1. `git clone git@github.com:colbycheeze/dotfiles.git ~/dotfiles && cd ~/dotfiles && chmod a+x setup.sh && ./setup/setup.sh`

## Finishing touches
  1. Register Divvy and add any hotkeys for window management
  1. Change key repeat rate with karabiner
  1. Swap ESC and CAPS key with seil [instructions](http://stackoverflow.com/a/8437594)
  1. Install fonts and color theme for iterm2
