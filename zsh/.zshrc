# Enable colors and change prompt
autoload -U colors && colors

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Version control info
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

export PLUGINS_DIR="$XDG_CONFIG_HOME/zsh/plugins"

# Theme
setopt PROMPT_SUBST
source $PLUGINS_DIR/ohmyzsh/lib/git.zsh
source $PLUGINS_DIR/ohmyzsh/themes/robbyrussell.zsh-theme

# Plugins
source $PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh
source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $PLUGINS_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $PLUGINS_DIR/zsh-256color/zsh-256color.plugin.zsh
source $PLUGINS_DIR/fzf/shell/key-bindings.zsh

# Source files
[[ -f $XDG_CONFIG_HOME/zsh/zsh_aliases ]] && source "$XDG_CONFIG_HOME/zsh/zsh_aliases"
[[ -f $XDG_CONFIG_HOME/zsh/zsh_functions ]] && source "$XDG_CONFIG_HOME/zsh/zsh_functions"
