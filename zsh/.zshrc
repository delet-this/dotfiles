# Source .aliasrc if exists
if [ -f ~/.aliasrc ]; then
    . ~/.aliasrc
fi

PURE_PROMPT_SYMBOL="λ"

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# completion
autoload -U compinit
compinit
# Enable completion menu
zstyle ':completion:*' menu select
zmodload zsh/complist
# Include hidden files.
_comp_options+=(globdots)
#setopt complete_aliases
# Auto update PATH entries
zstyle ':completion:*' rehash true

# auto quote urls
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# binds
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^R" history-incremental-search-backward
source /usr/share/fzf/**/key-bindings.zsh
source /usr/share/fzf/completion.zsh 2> /dev/null
bindkey '^H' backward-kill-word

# locale
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

# print stats if command took longer than 10s
# export REPORTTIME=10

# correction
setopt CORRECT

# more options
setopt nobeep
setopt autocd
# zstyle ':prompt:pure:prompt:*' color white

# pywal colors
# cat ~/.cache/wal/sequences;
(cat $HOME/.config/wpg/sequences &)

export FZF_DEFAULT_COMMAND="fd --type f --type l --hidden -E .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
#export FZF_ALT_C_COMMAND="fd -t d . $HOME"

export PF_INFO="title os host kernel uptime pkgs memory wm shell palette"
export PF_ASCII="linux"


# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load Aloxaf/fzf-tab
zcomet load chrissicool/zsh-256color
zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/git
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_FIXTERM=false
zcomet load ohmyzsh plugins/tmux
zcomet load mafredri/zsh-async
zcomet load sindresorhus/pure
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-completions
zcomet load MenkeTechnologies/zsh-more-completions
zcomet load ohmyzsh plugins/colored-man-pages

# These have to be after plugins for some reason
# Ctrl backspace, Ctrl left/right
bindkey '^H' backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

