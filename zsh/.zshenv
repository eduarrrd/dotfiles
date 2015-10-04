#! /bin/sh
export EDITOR=vim

#export PATH="$HOME/.cabal/bin:$PATH"

#export PATH="$HOME/.texlive/2013/bin/x86_64-linux:$PATH"
#export INFOPATH="$HOME/.texlive/2013/texmf-dist/doc/info:$INFOPATH"
#export MANPATH="$HOME/.texlive/2013/texmf-dist/doc/man:$MANPATH"

#export PATH="$HOME/.matlab/current/bin:$PATH"

[ "$XDG_CACHE_HOME" ] || export XDG_CACHE_HOME="$HOME/.cache"
[ "$XDG_CONFIG_HOME" ] || export XDG_CONFIG_HOME="$HOME/.config"
[ "$XDG_DATA_HOME" ] || export XDG_DATA_HOME="$HOME/.local/share"
