#!/bin/sh
source ~/dotfiles/setup/functions.sh

fancy_echo "Symlinking VSCode settings"
ln -s ~/dotfiles/Code/User ~/Library/Application\ Support/Code/User

fancy_echo "Installing Vscode"
brew cask install visual-studio-code

fancy_echo "Installing plugins"
code --install-extension vscodevim.vim
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension dbaeumer.vscode-eslint
code --install-extension ryanolsonx.solarized
code --install-extension PKief.material-icon-theme
code --install-extension hoovercj.vscode-settings-cycler
code --install-extension ionutvmi.path-autocomplete
code --install-extension capaj.vscode-exports-autocomplete
code --install-extension EditorConfig.EditorConfig
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension jaspernorth.vscode-pigments
code --install-extension stevencl.addDocComments
