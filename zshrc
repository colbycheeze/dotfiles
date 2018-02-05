# Setup for NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Setup for Yarn
export PATH="$PATH:`yarn global bin`"

# Configure autoload of nvm version based on presence of .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]];
    then
      echo " @ %{$fg_bold[red]%}%{$current_branch✷ %}%{$reset_color%}%{$fg[blue]%}%{$reset_color%}"
    # elif [[ ! $(git diff-index --cached --quiet HEAD --ignore-submodules --) ]];
    elif [[ $(git diff --cached --exit-code) ]];
    then
      echo " @ %{$fg_bold[yellow]%}%{$current_branch ⦿%}%{$reset_color%}%{$fg[blue]%}%{$reset_color%}"
    else
      echo " @ %{$fg_bold[green]%}%{$current_branch ✔%}%{$reset_color%}%{$fg[blue]%}%{$reset_color%}"
    fi
  fi
}
setopt promptsubst

export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$(echo " 🧀 : ")%}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) ➝  '

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

stty -ixon

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.bin:$PATH"
eval "$(rbenv init - --no-rehash)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Brazil
export PATH=$BRAZIL_CLI_BIN:$PATH
export PATH=$HOME/.toolbox/bin:$PATH
