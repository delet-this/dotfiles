# Add ~/.local/bin to $PATH
export PATH="$HOME/.local/bin:$PATH"

# Set default applications
export EDITOR="vim"
export VEDITOR="code"
export TERMINAL="termite"
export BROWSER="chromium"

export QT_ENABLE_HIGHDPI_SCALING=0
export QT_QPA_PLATFORMTHEME="gtk2" # Use gtk2 theme for qt
#export __GL_SYNC_DISPLAY_DEVICE=DVI-D-0
#export VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=DVI-D-0

# Start X
if ([ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ]); then
  exec startx -- -keeptty vt1 &> /dev/null
fi
