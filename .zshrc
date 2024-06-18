# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="Coldark-Dark"
export PATH="$PATH:$HOME/.local/bin"

# FZF
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# find-in-file - usage: fif <searchTerm>
fif() {
  local search_string
  if [ ! "$#" -gt 0 ]; then
    read "search_string?Enter the string to search for: "
    if [ -z "$search_string" ]; then
      echo "No search string entered!"
      return 1
    fi
  else
    search_string=$1
  fi
  rg --files-with-matches --no-messages "$search_string" | fzf --preview "bat --style=numbers --color=always {} | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$search_string' || rg --ignore-case --pretty --context 10 '$search_string' {}"
}

zle -N fif
bindkey '^F' fif

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

ZSH_THEME="random"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# Navigation aliases
alias cd='z'
alias ..='z ..'
alias ...='z ../..'
alias ....='z ../../..'
alias ~='z ~'

# Listing aliases
alias ls='eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias lc='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias ll='eza -l --color=always --long --git --icons=always'
alias la='eza -a --color=always --long --git --icons=always'
alias lt='eza --tree --level=2 --icons=always --color=always'

# Git aliases
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gl='git log --oneline --decorate'

# Command shortcuts
alias h='history'
alias c='clear'
alias e='exit'

# Directory manipulation aliases
alias mkdir='mkdir -p'
alias rm="trash"
alias rmdir='rm -r'
alias tl="trash-list"
alias tr="trash-restore"
alias te="trash-empty"
# System management aliases
alias reboot='sudo systemctl reboot'
alias shutdown='sudo systemctl poweroff'

# # Package management aliases for Debian
alias a='sudo apt'
alias ag='sudo apt-get'

# Update package lists
alias au='sudo apt update'
alias agu='sudo apt-get update'

# Upgrade installed packages
alias aup='sudo apt upgrade'
alias agu='sudo apt-get upgrade'

# Install packages
alias ai='sudo apt install'
alias agi='sudo apt-get install'

# Remove packages
alias ar='sudo apt remove'
alias agr='sudo apt-get remove'
alias ap='sudo apt purge'
alias agp='sudo apt-get purge'

# Search for packages
alias as='apt search'
alias ags='apt-cache search'

# Show package information
alias ai='apt show'
alias agi='apt-cache show'

# List installed packages
alias al='apt list --installed'
alias agl='apt list --installed'

# Show package version
alias av='apt showpkg'
alias agv='apt-cache showpkg'

# Autoclean
alias aac='sudo apt autoclean'
alias agac='sudo apt-get autoclean'

# Clean
alias ac='sudo apt clean'
alias agc='sudo apt-get clean'

# Autoremove
alias aar='sudo apt autoremove'
alias agar='sudo apt-get autoremove'
#alias neofetch='neofetch --source ~/.config/neofetch/neofetchlogo.txt'

# bat
alias cat="bat"

# amixer
alias unmute="amixer set Master unmute"
alias mute="amixer set Master mute"
alias unmutes="amixer set Speaker unmute"
alias mutes="amixer set Speaker mute"

# systemctl
alias status="systemctl status"
alias start="systemctl start"
alias stop="systemctl stop"
alias restart="systemctl restart"
alias suspend="systemctl suspend"
alias rnet="systemctl restart networking.service"

# npm
alias ni="npm install"
alias nid="npm install --save-dev"
alias nu="npm uninstall"
alias nup="npm update"
alias nr="npm run"
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrt="npm run test"
alias nrtw="npm run test:watch"
alias nrtb="npm run test:build"
alias naf="npm audit fix"
alias naff="npm audit fix --force"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/code/.bun/_bun" ] && source "/home/code/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"