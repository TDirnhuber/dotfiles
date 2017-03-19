#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

export VISUAL=emacs
export EDITOR="$VISUAL"
export PYTHONPATH="$PYTHONPATH:/home/toby/code/poker"
PS1='\W \$ '


. ~/.bash_aliases
