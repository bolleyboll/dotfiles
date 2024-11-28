#------------------------------
# Startup
#------------------------------
if command -v fastfetch &> /dev/null; then
  fastfetch
elif command -v neofetch &> /dev/null; then
  neofetch
fi

#------------------------------
# Powerlevel10k Instant Prompt - Needs to be at the Start
#------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#------------------------------
# Env
#------------------------------
export PATH=$PATH:$HOME/.scripts:/opt/homebrew/opt/openjdk@11/bin
export EDITOR="vim"
export BROWSER="firefox"
export PAGER="less"

#------------------------------
# ZINIT
#------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#------------------------------
# ZSH Plugins
#------------------------------
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#------------------------------
# Completion
#------------------------------
zinit snippet OMZP::archlinux
zinit snippet OMZP::argocd
zinit snippet OMZP::aws
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::command-not-found
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::gcloud
zinit snippet OMZP::git
zinit snippet OMZP::git-commit
zinit snippet OMZP::golang
zinit snippet OMZP::helm
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::mvn
zinit snippet OMZP::nmap
zinit snippet OMZP::node
zinit snippet OMZP::npm
zinit snippet OMZP::nvm
zinit snippet OMZP::pip
zinit snippet OMZP::python
zinit snippet OMZP::pylint
zinit snippet OMZP::rsync
zinit snippet OMZP::sudo
zinit snippet OMZP::systemd
zinit snippet OMZP::terraform

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

#------------------------------
# Completion Styling
#------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#------------------------------
# Keybindings
#------------------------------
bindkey -e
bindkey '^r' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

#------------------------------
# History
#------------------------------
HISTSIZE=5000
HISTFILE=~/.histfile
SAVEHIST=$HISTSIZE
HISTDUP=erase

#------------------------------
# Opts
#------------------------------
setopt appendhistory
setopt autocd
setopt extendedglob
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt nomatch
setopt notify
setopt sharehistory

#------------------------------
# Shell Integrations
#------------------------------
# FZF
eval "$(fzf --zsh)"
# Zoxide
eval "$(zoxide init --cmd cd zsh)"
# Homebrew
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#------------------------------
# Alias
#------------------------------
alias ls="ls --color -hF"
alias ll="echo '-------------------------------------------------------------------------------' && echo 'Inode | Perms | NumLinks | Owner | Group | Size | Month | Day | Time | Filename' && echo '-------------------------------------------------------------------------------' && ls --color -lhia"
alias warpc="sudo warp-cli connect"
alias warpd="sudo warp-cli disconnect"
alias git-tree="git log --graph --oneline --all"
alias brew-mine="sudo chown -R $(whoami) /opt/homebrew"
alias work-mine="sudo chown -R $USER /Users/amangupta/Public/Work"
alias find-ips="grep -Eo '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' $1"
alias fix-docker="rm -rf ~/Library/Group\ Containers/group.com.docker\ && rm -rf ~/Library/Containers/com.docker.docker\ && rm -rf ~/.docker"
alias give-plex-access="sudo chown -R plex:plex /run/media/bolleyboll/Aman_HDD"
alias protonc="protonvpn-cli c"
alias protond="protonvpn-cli d"
alias fix-sound="sudo pulseaudio -k && sudo pulseaudio --start"
alias update-theme="kquitapp5 plasmashell && kstart5 plasmashell"
alias rem-hdd="sudo udisksctl unmount -b /dev/sdb2 && sudo udisksctl power-off -b /dev/sdb"
alias pacclean="yay -Sc"
alias git-tree="git log --graph --oneline --all"
alias update-mirrorlist="sudo reflector --save /etc/pacman.d/mirrorlist --protocol 'http,https' --latest 300 --sort rate --country 'India,' && cat /etc/pacman.d/mirrorlist"
alias fix-bluetooth="sudo systemctl restart bluetooth && pulseaudio -k && pulseaudio --start"
alias compositor-on="qdbus org.kde.KWin /Compositor resume"
alias compositor-off="qdbus org.kde.KWin /Compositor suspend"
