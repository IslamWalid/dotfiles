# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export FILE="ranger"
export TERMINAL="kitty"
export GOPATH="$HOME/.go"

# add needed exe directories to path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"

# integrate bat with man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# zsh history config
export HIST_IGNORE_ALL_DUPS=true
export HIST_EXPIRE_DUPS_FIRST=true

# zsh vi mode config
export ZVM_VI_EDITOR=$EDITOR
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
export ZVM_KEYTIMEOUT="0.5"
export ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
export ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
export ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
export ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
