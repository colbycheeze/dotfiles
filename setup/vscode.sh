#!/bin/bash
source $HOME/dotfiles/setup/functions.sh

fancy_echo "Symlinking VSCode settings"
ln -s $HOME/dotfiles/Code/User $HOME/.config/Code/User

fancy_echo "Installing Vscode"
sudo snap install vscode --classic

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

fancy_echo "Installing required font package, you will have to accept prompts!"
sudo apt-get install ttf-mscorefonts-installer
