cinemadisplay
xrdb -merge .Xresources
unclutter -idle 1 &
#ls /home/azer/.config/wallpaper/images/favs/*.jpg|shuf -n 1| xargs feh --bg-fill
wallpaper /home/azer/.config/wallpaper/images/kiss.jpg
setterm -blank 0
xset s off
xscreensaver -no-splash &
xmodmap .xmodmap
exec xmonad
