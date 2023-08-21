#------------------------------
# Env Vars
#------------------------------
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
export EDITOR="vim"
export BROWSER="firefox"
export PAGER="less"

#-----------------------------
# Dircolors
#-----------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#------------------------------
# Prompt - Oh-My-Posh
#------------------------------
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/pure.omp.json)"
fi

#------------------------------
# ZSHRC
#------------------------------

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/amangupta/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#------------------------------
# ZSH Syntax Highlighting & Autocomplete
#------------------------------
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#------------------------------
# NVM
#------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#------------------------------
# Alias stuff
#------------------------------
alias ls="ls --color -hF"
alias ll="echo '-------------------------------------------------------------------------------' && echo 'Inode | Perms | NumLinks | Owner | Group | Size | Month | Day | Time | Filename' && echo '-------------------------------------------------------------------------------' && ls --color -lhia"
alias warpc="sudo warp-cli connect"
alias warpd="sudo warp-cli disconnect "
alias git-tree="git log --graph --oneline --all"
alias brew-mine="sudo chown -R $(whoami) /opt/homebrew"
alias work-mine="sudo chown -R $(whoami) /Users/amangupta/Public/Work"
alias find-ips="grep -Eo '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)' $1"
alias fix-docker="rm -rf ~/Library/Group\ Containers/group.com.docker\ && rm -rf ~/Library/Containers/com.docker.docker\ && rm -rf ~/.docker"

#------------------------------
# ShellFuncs
#------------------------------
# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#------------------------------
# ZSH Keybindings
#------------------------------
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

#------------------------------
# GCloud
#------------------------------
source /opt/homebrew/share/google-cloud-sdk/path.zsh.inc
source /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc

#------------------------------
# Startup
#------------------------------
neofetch
