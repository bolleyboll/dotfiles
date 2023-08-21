#------------------------------
# Env Vars
#------------------------------
export PATH=$PATH:$HOME/.scripts
export EDITOR="vim"
export BROWSER="firefox"
export PAGER="less"

#------------------------------
# ZSH Syntax Highlighting & Autocomplete
#------------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#------------------------------
# NVM
#------------------------------
source /usr/share/nvm/init-nvm.sh

#-----------------------------
# Dircolors
#-----------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#------------------------------
# Prompt - Oh-My-Posh
#------------------------------
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.scripts/prompt/hul-mine.omp.json)"
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
zstyle :compinstall filename '/home/bolleyboll/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#------------------------------
# Compositor
#------------------------------
export KWIN_TRIPLE_BUFFER=1

#------------------------------
# Alias stuff
#------------------------------
alias ls="ls --color -hF"
alias ll="echo '-------------------------------------------------------------------------------' && echo 'Inode | Perms | NumLinks | Owner | Group | Size | Month | Day | Time | Filename' && echo '-------------------------------------------------------------------------------' && ls --color -lhia"
alias give-plex-access="sudo chown -R plex:plex /run/media/bolleyboll/Aman_HDD"
alias warpc="sudo warp-cli connect"
alias warpd="sudo warp-cli disconnect "
alias protonc="protonvpn-cli c"
alias protond="protonvpn-cli d"
alias fix-sound="sudo ulseaudio -k && sudo pulseaudio --start"
alias update-theme="kquitapp5 plasmashell && kstart5 plasmashell"
alias rem-hdd="sudo udisksctl unmount -b /dev/sdb2 && sudo udisksctl power-off -b /dev/sdb"
alias pacclean="yay -Sc"
alias git-tree="git log --graph --oneline --all"
alias update-mirrorlist="sudo reflector --save /etc/pacman.d/mirrorlist --protocol 'http,https' --latest 300 --sort rate --country 'India,' && cat /etc/pacman.d/mirrorlist"
alias fix-bluetooth="sudo systemctl restart bluetooth && pulseaudio -k && pulseaudio --start"
alias compositor-on="qdbus org.kde.KWin /Compositor resume"
alias compositor-off="qdbus org.kde.KWin /Compositor suspend"

#------------------------------
# ShellFuncs
#------------------------------
# Coloured Manuals
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
# Comp stuff
#------------------------------
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#------------------------------
# ZSH Keybindings
#------------------------------
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

#------------------------------
# Startup
#------------------------------
neofetch
