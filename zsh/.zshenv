# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################
export DOTFILES="$HOME/.dotfiles"

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# alternate way to define variables
# export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
# export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

#refer these links to see how PATHS are defined. 
#https://github.com/belak/dotfiles/blob/main/zshenv
#https://github.com/mattmc3/dotfiles/blob/main/.config/zsh/.zshenv

# ---- path variables -----
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/Users/dross/texlive/2022/bin/universal-darwin:$PATH
export MANPATH=/Users/dross/texlive/2022/texmf-dist/doc/man:$MANPATH
export INFOPATH=Users/dross/texlive/2022/texmf-dist/doc/info:$INFOPATH

export PATH=/Users/dross/Downloads/platform-tools:$PATH
export PATH=/opt/homebrew/opt/curl/bin:$PATH


#Disable homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

#dbt config
export DBT_PROFILES_DIR=~/.config/.dbt/


# Load cargo env if available
if [[ -f "$HOME/.cargo/env" ]]; then source "$HOME/.cargo/env"; fi

