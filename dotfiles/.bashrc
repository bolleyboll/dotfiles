#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Term
export PS1="\[\033[38;5;39m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;176m\]\h\[$(tput sgr0)\] [\[$(tput sgr0)\]\[\033[38;5;215m\]\w\[$(tput sgr0)\]]\[$(tput sgr0)\]"

#Startup
neofetch

#NVM
source /usr/share/nvm/init-nvm.sh
