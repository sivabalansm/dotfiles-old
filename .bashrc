#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Aliases
alias ls='ls --color=auto'
alias grep='grep --color'
alias arduino='arduino-cli'
[ -e /bin/xclip ] && alias clipboard='xclip -selection clipboard'
[ -e /bin/highlight ] && alias ccat='highlight -O ansi'
#env variables
export EDITOR="vim"
export PATH="$PATH:$HOME/.local/bin"
#My prompt with color
export PS1="[\[\e[1;32m\]\u\[\e[m\]\[\e[1;32m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\]]\\$ "


#infinite history
HISTZIE=-1
HISTFILESIZE=-1

#vi mode in terminal
set -o vi
