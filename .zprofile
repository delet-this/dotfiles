PATH="$HOME/.local/bin:$PATH"

# start x
if ([ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ]); then
  #exec startx
  exec startx -- -keeptty vt1 &> /dev/null
fi

