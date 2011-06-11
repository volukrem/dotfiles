xrdb -merge .Xresources
setdisplay
ls /home/azer/.config/wallpaper/images/*.jpg|shuf -n 1| xargs feh --bg-fill
setterm -blank 0
xset s off
xmodmap .xmodmap
exec xmonad
