#WINEDLLPATH="$HOME/rpc-wine/bin32:$HOME/rpc-wine/bin64:$WINEDLLPATH"
WINEDLLPATH="/usr/lib/discord-rpc-wine/x86_64:/usr/lib/discord-rpc-wine/i686:$WINEDLLPATH"
PATH="$HOME/.local/bin:$PATH"

# start x
if ([ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ]); then
  #exec startx
  exec startx -- -keeptty vt1 &> /dev/null
fi

