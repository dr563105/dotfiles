# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.dotfiles"

bindkey -v

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_plugins.sh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#  zsh-autosuggestions
# )


autoload -Uz compinit 
compinit

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@1.1

# ---- aliases -----
alias suzsh='subl ~/.zshrc'
alias vzsh='vim ~/.zshrc'
alias zsh='source ~/.zshrc'
alias ll="ls -lahF" # lists in long form including hidden files and human readable size format while appending entries.
alias lt="ls -latrh" # sorted list w.r.t time reverse and size in human readable format with appended entries.
alias l="ls -lah" # back up to ll to allow for typo.
alias lS='ls -lahFSr' # prints list in the reverse order of size in long form including hidden files. 
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias cd..="cd .."
alias cd2.="cd ../.."
alias cd3.="cd ../../.."
alias cd4.="cd ../../../.."
alias py="python3"
alias vim="nvim"
alias inloc="source ~/ros2_foxy/install/setup.zsh"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias tmux='tmux -u'

# from aws
alias fb='cd ~/fastbook/'
alias fs='cd ~/fastsetup/'
alias ce='conda env list'
alias ca='conda activate'
alias ma='mamba activate'
alias cad='conda deactivate'
alias mad='mamba deactivate'
alias cc='conda create -n'
alias tmux='tmux -u'
alias jn='jupyter notebook'
alias nvd='nvidia-smi'
alias nvdw='watch -n 1 nvidia-smi'

# for mac
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/bin/git:$PATH
export PATH=/usr/local/texlive/2020/bin/x86_64-darwin:$PATH
export MANPATH=/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH
export INFOPATH=usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH

PROMPT='%{$fg[yellow]%}[%*] '$PROMPT 
# PROMPT='%2~ %# ' 
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dross/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
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
