#!/bin/sh

fancy_echo "Apply system and application defaults."

fancy_echo_line "System - Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

fancy_echo_line "System - Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

fancy_echo_line "System - Disable smart quotes (not useful when writing code)"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

fancy_echo_line "System - Disable smart dashes (not useful when writing code)"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

fancy_echo_line "System - Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

fancy_echo_line "System - Automatically restart if system freezes"
sudo systemsetup -setrestartfreeze on

fancy_echo_line "Keyboard - Enable keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

fancy_echo_line "Keyboard - Set a fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0

fancy_echo_line "Trackpad - Map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

fancy_echo_line "Trackpad - Enable tap to click for current user and the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

fancy_echo_line "Trackpad - Use CONTROL (^) with scroll to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

fancy_echo_line "Trackpad - Follow keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

fancy_echo_line "Bluetooth - Increase sound quality for headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

fancy_echo_line "Dock - Automatically hide and show"
defaults write com.apple.dock autohide -bool true

fancy_echo_line "Dock - Remove the auto-hiding delay"
defaults write com.apple.Dock autohide-delay -float 0

fancy_echo_line "Dock - Don’t show Dashboard as a Space"
defaults write com.apple.dock "dashboard-in-overlay" -bool true

fancy_echo_line "Finder - Show the $HOME/Library folder"
chflags nohidden $HOME/Library

fancy_echo_line "Finder - Show hidden files"
defaults write com.apple.finder AppleShowAllFiles -bool true

fancy_echo_line "Finder - Show filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

fancy_echo_line "Finder - Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

fancy_echo_line "Finder - Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

fancy_echo_line "Finder - Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

fancy_echo_line "Finder - Display full POSIX path as window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

fancy_echo_line "Finder - Use list view in all Finder windows"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

fancy_echo_line "Finder - Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

fancy_echo_line "Finder - Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool true
