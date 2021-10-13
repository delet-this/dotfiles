# Add ~/.local/bin to $PATH
export PATH="$HOME/.local/bin:$PATH"

# Set default applications
export EDITOR="nvim"
export VEDITOR="code"
export TERMINAL="kitty"
export BROWSER="firefox"

#export __GL_SYNC_DISPLAY_DEVICE=DVI-D-0
#export VDPAU_NVIDIA_SYNC_DISPLAY_DEVICE=DVI-D-0
#export QT_QPA_PLATFORMTHEME="gtk2" # Use gtk2 theme for qt
export QT_SCALE_FACTOR_ROUNDING_POLICY=Round

# Enable Firefox Wayland support
export MOZ_ENABLE_WAYLAND=1
# Fix opening links from XWayland apps in Firefox
export MOZ_DBUS_REMOTE=1
# PyCharm wayland fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Start graphical session
if ([ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ]); then
  # exec startx -- -keeptty vt1 &> /dev/null
  # XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
  # XDG_SESSION_TYPE=wayland exec gnome-shell --wayland
  export XDG_CURRENT_DESKTOP="sway:Unity"
  export XDG_SESSION_TYPE=wayland
  export LIBSEAT_BACKEND=logind
  exec sway
  # startx
fi
