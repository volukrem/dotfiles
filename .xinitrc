xrdb -merge .Xresources
unclutter -idle 1 &
wallpaper /home/azer/wallpaper.jpg
setterm -blank 0
xset s off
xmodmap .xmodmap
xset -r 135 
exec xmonad
xrandr --output VGA-1 --auto 
