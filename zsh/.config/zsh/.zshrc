# Set any helper functions used by your antidote config.
function is-macos() {
  [[ $OSTYPE == darwin* ]]
}

#Prevent history from storing secrets, keys. Start with a space before the command to make history ignore it.
export HIST_IGNORE="(ls*|cat*|*AWS*|*SECRET*|*KEY*|*PASS*|*DBT_*|*SNOWFLAKE_*)"
setopt HIST_IGNORE_SPACE

zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'
zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

# Activate antidote for zsh plugins. Refer https://getantidote.github.io/install
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# $ZDOTDIR is defined in ~/.zshenv file. Default value of ZDOTDIR is ~/$HOME
if [ -f $ZDOTDIR/.zsh_plugins.txt ]; then
    # initialise plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
    antidote load
fi

#to know antidote home, use `antidote home`
#to clear out zsh plugins, use `rm -rf $(antidote home) && rm ~/.zsh_plugins.zsh`
#to list installed plugins, use `antidote list`
#to update plugins, use `antidote update`

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@1.1

# complete -o nospace -C /opt/homebrew/bin/terraform terraform

# for zsh-history-search plugin. Movement setting.
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# >>> conda initialise >>>
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
# <<< conda initialise <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dross/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dross/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dross/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dross/google-cloud-sdk/completion.zsh.inc'; fi

