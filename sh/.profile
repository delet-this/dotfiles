# Add ~/.local/bin to $PATH
export PATH="$HOME/.local/bin:$PATH"

# Set default applications
[ -x "$(command -v nvim)" ] && export EDITOR="nvim" || export EDITOR="vim"
export VEDITOR="code"
export TERMINAL="alacritty"
export BROWSER="firefox"

#export QT_QPA_PLATFORMTHEME="gtk2" # Use gtk2 theme for qt
#export __GL_SYNC_DISPLAY_DEVICE=DVI-D-0
#export VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=DVI-D-0

# export QT_ENABLE_HIGHDPI_SCALING=0
export QT_SCALE_FACTOR_ROUNDING_POLICY=Round

export MOZ_ENABLE_WAYLAND=1

export XDG_CURRENT_DESKTOP="sway:Unity"
export XDG_SESSION_TYPE=wayland
export LIBSEAT_BACKEND=logind
export XKB_DEFAULT_LAYOUT="us(altgr-intl),fi"
export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle


# Start graphical session
if ([ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ]); then
  # exec startx -- -keeptty vt1 &> /dev/null
  exec sway
fi
