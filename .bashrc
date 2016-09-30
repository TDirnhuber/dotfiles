#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

export VISUAL=emacs
export EDITOR="$VISUAL"

PS1='\W \$ '

. ~/.bash_aliases
