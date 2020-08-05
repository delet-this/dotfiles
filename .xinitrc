#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export XDG_CURRENT_DESKTOP=i3
export DESKTOP_SESSION=i3

# autoruns
#setxkbmap fi &
setxkbmap -layout us -variant altgr-intl &
xset r rate 300 50 &	# Faster key repeat

# desktop only autoruns
if [ $(uname -n) = "valve" ]; then
	picom --config ~/.config/picom/picom.conf &
	discord &
	steam-runtime &
	python ~/animu_rpc_server.py &
	python ~/discord-rpc-mpris/main.py &
fi

# start window manager
exec i3
