##Set wallpaper
hsetroot -fill ~/pictures/wallpapers/minimal2.png

##Update display config
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
export PANEL_FIFO="/tmp/panel-fifo"
##Start Music Services
mpd
mpc

#Switch escape and capslock
setxkbmap -layout gb -option caps:escape

#Start bspwm, hide the cursor if inactive
unclutter &
exec bspwm
