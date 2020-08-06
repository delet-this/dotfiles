TERM=xterm-256color
PURE_PROMPT_SYMBOL="λ"

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
setopt complete_aliases

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

# aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias cal='cal -m'
alias ccat='pygmentize -g'
alias reboot="sudo systemctl reboot"
alias poweroff="sudo systemctl poweroff"
alias halt="sudo systemctl halt"
alias weather="curl wttr.in/varkaus"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias yt="youtube-dl --add-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# locale
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

# print stats if command took longer than 10s
export REPORTTIME=10



# correction
setopt CORRECT

# more options
setopt nobeep
setopt autocd
#zstyle ':prompt:pure:prompt:*' color white

export PF_INFO="title os host kernel uptime pkgs memory wm shell palette"
export PF_ASCII="linux"

#neofetch --off --cpu_temp C --refresh_rate on --memory_percent on
pfetch

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

## End of Zinit's installer chunk
zinit light mafredri/zsh-async
zinit light sindresorhus/pure
zinit light zdharma/fast-syntax-highlighting
