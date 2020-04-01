export PATH="$HOME/.local/bin:$PATH"
export QT_STYLE_OVERRIDE="gtk2"

# start x
if ([ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ]); then
  #exec startx
  exec startx -- -keeptty vt1 &> /dev/null
fi

