# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mytheme"

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

if [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi

if [ -f $HOME/.zsh_plugins.sh ]; then
    source $HOME/.zsh_plugins.sh
fi

# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg, https://robotmoon.com/256-colors/
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#00ffd7,bg=bold,underline' 

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

#Prevent history from storing secrets, keys. Start with a space before the command to make history ignore it.
setopt HIST_IGNORE_SPACE

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@1.1

# ---- aliases -----
if [ -f ~/.aliases.zsh ]; then
    source $HOME/.aliases.zsh
fi

# autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# ---- path variables -----
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/Users/dross/texlive/2022/bin/universal-darwin:$PATH
export MANPATH=/Users/dross/texlive/2022/texmf-dist/doc/man:$MANPATH
export INFOPATH=Users/dross/texlive/2022/texmf-dist/doc/info:$INFOPATH

export PATH=/Users/dross/Downloads/platform-tools:$PATH
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dross/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then eval "$__conda_setup"
else
    if [ -f "/Users/dross/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/dross/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dross/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/dross/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/dross/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dross/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dross/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dross/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dross/google-cloud-sdk/completion.zsh.inc'; fi

#cargo(rust) env set 
source "$HOME/.cargo/env"

export PATH=/opt/homebrew/opt/curl/bin:$PATH

#Disable homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1
