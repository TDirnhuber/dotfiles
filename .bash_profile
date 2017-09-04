#
#~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc
PATH="$PATH:~/scripts:~/.config/bspwm/panel"
export PANEL_FIFO="/tmp/panel-fifo"
export PATH
. ~/.bash_aliases

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
