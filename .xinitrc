xrdb -merge .Xresources
#setdisplay
ls /home/azer/.config/wallpaper/images/*.jpg|shuf -n 1| xargs feh --bg-fill
/usr/bin/syndaemon -d -t -i 2
xcompmgr-dana -c &
setterm -blank 0
exec xmonad
