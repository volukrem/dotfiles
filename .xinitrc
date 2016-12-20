xrdb -merge .Xresources
unclutter -idle 1 &
feh --fill-bg /home/azer/wallpaper.jpg
setterm -blank 0
xset s off
xmodmap .xmodmap
xset -r 135 
xrandr --output VGA-1 --auto 
exec xmonad
