#!/bin/sh

fancy_echo "Installing VSCode"
brew cask install visual-studio-code

fancy_echo "Installing VSCode packages"
code --install-extension robertohuertasm.vscode-icons
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension dbaeumer.vscode-eslint
code --install-extension vscodevim.vim
code --install-extension alefragnani.project-manager
code --install-extension dzannotti.vscode-babel-coloring
code --install-extension TwentyChung.jsx
code --install-extension christian-kohler.npm-intellisense
code --install-extension EditorConfig.EditorConfig
code --install-extension anseki.vscode-color
code --install-extension extr0py.vscode-relative-line-numbers
