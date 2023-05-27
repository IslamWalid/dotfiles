# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export FILE="lf"
export TERMINAL="alacritty"

# add needed exe directories to path
export GOPATH="$HOME/.go"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"

# integrate bat with man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# zsh history config
export HIST_IGNORE_ALL_DUPS=true
export HIST_EXPIRE_DUPS_FIRST=true

# XDG_ENV_VARS
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
