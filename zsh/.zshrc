# Enable colors and change prompt
autoload -U colors && colors

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

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

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='%{$fg_bold[blue]%}[%{$fg_bold[red]%}%n%{$fg_bold[blue]%}@%m] %{$fg_bold[cyan]%}%c%{$reset_color%} $(git_prompt_info)
'
PROMPT+="%(?:%{$fg_bold[green]%}➜  %{$reset_color%}:%{$fg_bold[red]%}➜  %{$reset_color%})"

# Plugins
source $PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh
source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $PLUGINS_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $PLUGINS_DIR/zsh-256color/zsh-256color.plugin.zsh
source $PLUGINS_DIR/fzf/shell/key-bindings.zsh

# Source files
[[ -f $XDG_CONFIG_HOME/zsh/zsh_aliases ]] && source "$XDG_CONFIG_HOME/zsh/zsh_aliases"
[[ -f $XDG_CONFIG_HOME/zsh/zsh_functions ]] && source "$XDG_CONFIG_HOME/zsh/zsh_functions"
