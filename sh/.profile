export PATH="$HOME/.local/bin:$HOME/.emacs.d/bin:$PATH"
[ -f "/home/himera/.ghcup/env" ] && source "/home/himera/.ghcup/env" # ghcup-env
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
# Emacs LSP plists
export LSP_USE_PLISTS=true

# Start graphical session
if ([ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ]); then
  # exec startx -- -keeptty vt1 &> /dev/null
  # export WLR_DRM_DEVICES=/dev/dri/card0
  export XDG_CURRENT_DESKTOP="sway:Unity"
  export XDG_SESSION_TYPE=wayland
  export LIBSEAT_BACKEND=logind
  # exec dbus-run-session sway
  exec sway
  # startx
fi
