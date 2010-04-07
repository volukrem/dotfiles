#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb -merge .Xresources
exec awesome

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
