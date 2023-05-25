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

# add hidden files to fzf
export FZF_DEFAULT_COMMAND='find .'

# fuzz directories
function fd {
		pwd=$(pwd)
		if [ -n "$1" ]
		then
			cd $1
			path=$(fzf)
			if [ -f "$path" ]
			then
				file_dir=$(echo $path | rev | sed 's/[^/]\+\///' | rev)
				cd $file_dir
			elif [ -d "$path" ]
			then
				cd $path
			else
				cd $pwd
			fi
		elif [ "$(find $pwd -type d)" = "$pwd" ]
		then
			cd /
			path=$(fzf)
			if [ -f "$path" ]
			then
				file_dir=$(echo $path | rev | sed 's/[^/]\+\///' | rev)
				cd $file_dir
			elif [ -d "$path" ]
			then
				cd $path
			else
				cd $pwd
			fi
		else
			path=$(fzf)
			if [ -f "$path" ]
			then
				file_dir=$(echo $path | rev | sed 's/[^/]\+\///' | rev)
				cd $file_dir
			elif [ -d "$path" ]
			then
				cd $path
			fi
		fi
}

#infinite history
HISTZIE=-1
HISTFILESIZE=-1

#vi mode in terminal
set -o vi
