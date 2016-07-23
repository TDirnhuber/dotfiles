##Set wallpaper
hsetroot -fill ~/Pictures/Bird.png
##Update display config
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
##Start Music Services
mpd
mpc
#Start bspwm, hide the cursor if inactive
sxhkd &
unclutter &
exec bspwm
