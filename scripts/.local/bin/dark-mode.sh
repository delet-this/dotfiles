#!/usr/bin/env bash

# dark-mode [light|dark|refresh]
# sets dark mode on or off

# Copyright (C) 2021 Bob Hepple <bob.hepple@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# I like to have this called by my
# ~/.config/i3blocks/i3blocks/weather script which runs every 10m and
# knows about sunset and sunrise times.

PROG=$( basename $0 )

# KITTY_ONLY=""
# [[ "$1" == "--kitty-only" ]] && {
#     KITTY_ONLY="true"
#     shift
# }

CMD="$1"

DARK_MODE_STATUS_FILE=~/.cache/dark-mode
CURRENT_DARK_MODE=$( cat $DARK_MODE_STATUS_FILE )

case $CMD in
    -h|--help)
        echo "Usage: $PROG <[on|start|dark]|refresh|[off|stop|light]>"
        echo
        echo "toggles or refreshes dark-mode for emacs, kitty, gtk and qt"
        exit 0
        ;;
    on|start|dark)
        CMD="dark"
        ;;
    re*)
        CMD="refresh"
        ;;
    *) # off|stop|light
        CMD="light"
        ;;
esac

if [[ "$CMD" == "refresh" ]]; then
    CMD="$CURRENT_DARK_MODE"
else
    [[ "$CURRENT_DARK_MODE" == "$CMD" ]] && exit 0
fi

# for emacs, these themes can be chosen from the standard ones (in
# custom-theme-load-path) or they can be installed in
# custom-theme-directory (usually ~/.emacs.d)
# They must have a filename of $THEMENAME-theme.el

case "$CMD" in
    light)
        # light mode
        # new_emacs_theme="dichromacy-bh"
        # new_emacs_theme="modus-operandi"
        #new_emacs_theme="Adwaita" # text background is #ededed !!!
        #new_emacs_theme="solarized-light"
        # new_emacs_modeline_theme="smart-mode-line-light"

        new_gtk_theme='Adwaita'
        #new_gtk_theme='Solarized-Light'
        #new_gtk_theme='Crux'

        # new_kitty_theme="$HOME/.config/kitty/Adwaita.conf"
        # new_kitty_theme=
        # new_fg='black'
        # new_fg='00/00/00'
        # new_bg='white'
        # new_bg='ff/ff/ff'
        # BRIGHTNESS=100
        # TERM_BACKGROUND=light
        ;;
    *)
        # dark mode
        #new_emacs_theme="dichromacy-dark-bh"
        # new_emacs_theme="modus-vivendi"
        #new_emacs_theme="manoj-dark-bh"
        #new_emacs_theme="solarized-dark"
        # new_emacs_modeline_theme="smart-mode-line-dark"

        new_gtk_theme='Adwaita-dark'
        #new_gtk_theme='Solarized-Dark'
        #new_gtk_theme='Crux-dark'

        #new_kitty_theme="$HOME/.config/kitty/Adwaita-dark.conf"
        # new_kitty_theme=
        # new_fg='white'
        # new_fg='ff/ff/ff'
        # new_bg='#232729'
        # new_bg='black'
        # new_bg='00/00/00'
        # BRIGHTNESS=0
        # TERM_BACKGROUND=dark
        ;;
esac

(
    [[ -z "$KITTY_ONLY" ]] && {
        # brightness $BRIGHTNESS

        # look for an emacs running as this user:
        # emacs_pid=$(pgrep -u $USER emacs | head -n 1)
        # [[ "$emacs_pid" ]] && emacsclient --eval "
        #   (progn
        #     (mapcar 'disable-theme custom-enabled-themes)
        #     (load-theme '$new_emacs_theme t))"
        #(load-theme '$new_emacs_modeline_theme))"

        f=~/.gtkrc-2.0
        [[ -w $f ]] && sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$new_gtk_theme\"/" $f

        # gtkreload # gtk2 only!

        f=~/.config/gtk-3.0/settings.ini
        [[ -w $f ]] && sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$new_gtk_theme/" $f

        # /usr/libexec/gsd-xsettings notifies gtk3 clients - start it in sway

        # these two appear to be completely equivalent:
        dconf write /org/gnome/desktop/interface/gtk-theme "'$new_gtk_theme'"
        #gsettings set org.gnome.desktop.interface gtk-theme $new_gtk_theme

        f=~/.config/qt5ct/qt5ct.conf
        [[ -w $f ]] && sed -i "s/^style=.*/style=$new_gtk_theme/" $f
    }

    # requires this in ~/.config/kitty/kitty.conf:
    # allow_remote_control yes
    # listen_on unix:/tmp/kitty-socket
    # for SOCK in /tmp/kitty-socket-*; do
    #     if [[ -r $new_kitty_theme ]]; then
    #         kitty @ --to=unix:$SOCK set-colors -a $new_kitty_theme
    #     else
    #         # this should work for all terms:
    #         for TERM in /dev/pts/[0-9]*; do
    #             if [[ -O $TERM ]]; then
    #                 {
    #                     printf "\\033]10;rgb:$new_fg\\033\\\\"
    #                     printf "\\033]11;rgb:$new_bg\\033\\\\"
    #                 } >$TERM
    #             fi
    #         done  
    #         # kitty @ --to=unix:$SOCK set_colors --all foreground=$new_fg background=$new_bg
    #     fi
    # done

    # for 'low-power' script:
    echo $TERM_BACKGROUND > $DARK_MODE_STATUS_FILE
) >/dev/null

# echo "TERM_BACKGROUND=$TERM_BACKGROUND; setup_prompt"

