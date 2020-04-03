export PATH="$HOME/.local/bin:$PATH"
export QT_STYLE_OVERRIDE="gtk2"

export EDITOR="vim"
export VEDITOR="subl3"
export TERMINAL="termite"
export BROWSER="firefox"

# start x
if ([ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ]); then
  exec startx -- -keeptty vt1 &> /dev/null
fi

