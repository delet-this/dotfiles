PURE_PROMPT_SYMBOL="λ"

# load zplugin
source ~/.zplugin/bin/zplugin.zsh

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# vi mode
#bindkey -v

# home and end binds
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# aliases
alias ls='ls --color=auto'
alias cal='cal -m'
alias ccat='pygmentize -g'
alias reboot="sudo systemctl reboot"
alias poweroff="sudo systemctl poweroff"
alias halt="sudo systemctl halt"
alias weather="curl wttr.in/varkaus"
alias graceful="~/gracefulshutdown.sh"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PATH="$HOME/.local/bin:$PATH"
#export WINEDLLPATH="$HOME/rpc-wine/bin32:$HOME/kisak/rpc-wine/bin64"
#export WINEDLLPATH="/usr/lib/discord-rpc-wine/x86_64:/usr/lib/discord-rpc-wine/i686:$WINEDLLPATH"


# locale
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

# default programs
export EDITOR='vim'
export VEDITOR='subl3'
export BROWSER='firefox'

# print stats if command took longer than 10s
export REPORTTIME=10

# completion
autoload -Uz compinit
zstyle ':completion:*' menu select=2
zstyle :compinstall filename '$HOME/.zshrc'
compinit
setopt complete_aliases

# correction
setopt CORRECT

# more options
setopt nobeep
setopt autocd

zplugin light mafredri/zsh-async
zplugin light sindresorhus/pure
zplugin light zdharma/fast-syntax-highlighting

#zstyle ':prompt:pure:prompt:*' color white 

neofetch --off --cpu_temp C --refresh_rate on --memory_percent on
