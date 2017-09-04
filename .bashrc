#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return
PS1='\W \$ '
. ~/.bash_aliases
export VISUAL=emacs
export EDITOR="$VISUAL"
export PYTHONPATH="$PYTHONPATH:~/code/poker"
export WORKON_HOME=~/.virtualenvs
if [ -f `which virtualenvwrapper_lazy.sh` ]; then
    source `which virtualenvwrapper_lazy.sh`
fi

