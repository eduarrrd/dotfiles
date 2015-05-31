HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

autoload -U colors && colors
zmodload zsh/complist

LPROMPT () {
#PS1="┌─[ %{$fg[cyan]%}%n@%m%{$fg_bold[blue]%} %~ %{$fg_no_bold[yellow]%}%(0?..%?)%{$reset_color%}]
#└─%(!.%{$fg[red]%}#.╼)%{$reset_color%} "
PS1="┌─[ %(!.%{$fg[magenta]%}%m.%{$fg[cyan]%}%n@%m) %{$fg_bold[blue]%} %~ %{$fg_no_bold[yellow]%}%(0?..%?)%{$reset_color%}]
└─╼%{$reset_color%} "
}

# Show current vi mode
function zle-line-init zle-keymap-select {
    RPS1="%{$fg[magenta]%}${${KEYMAP/vicmd/%B Command Mode %b}/(main|viins)/ }"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

LPROMPT

# Print most recently modified directory entries on `cd`
function chpwd() {
    [[ -n `print *(N)` ]] && ls -dt --color=auto -- *(om[1,7])
}

setopt appendhistory autocd extendedglob correct auto_pushd
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

bindkey -v
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias ls='ls --color=auto'
eval $(dircolors -b)

alias grep='grep -n --color=auto' 
alias la='ls -la'
alias ll='ls -lh'
export LESS="-R"

alias -s ps=gs
alias vi=vim

export BROWSER=firefox
export EDITOR=vim

alias tma='tmux attach -d -t'
alias git-tmux='tmux new -s $(basename $(pwd))'

alias f='nix-env -qaP | grep -i '

# 100MiB coredumps max
ulimit -c 204800

# Syntax highlighting! https://github.com/zsh-users/zsh-syntax-highlighting
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Get a gdb backtrace from a coredump
gdb_get_backtrace() {
    local exe=$1
    local core=$2

    gdb ${exe} \
        --core ${core} \
        --batch \
        --quiet \
        -ex "thread apply all bt full" \
        -ex "quit"
}

# For those pesky license server clients that hardcode "eth0"
fake_eth0() {
    local MAC="8e:68:e8:9b:94:b8"
    sudo sh -c "ip link add eth0 type dummy && ip link set dev eth0 addr $MAC"
}
alias u='nix-channel --update'
alias uu='nix-env -u --dry-run'
alias uuu='nix-env -u'
alias uuuu='nix-env -u --leq'
