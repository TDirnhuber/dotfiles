##Set wallpaper
hsetroot -fill ~/Pictures/ArchPF.png

##Update display config
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

##Start Music Services
mpd
mpc

#Switch escape and capslock
setxkbmap -option caps:swapescape

#Start bspwm, hide the cursor if inactive
demacs &
sxhkd &
unclutter &
exec bspwm
