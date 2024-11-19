# ---- aliases -----
alias szsh='subl ~/.config/zsh/.zshrc'
alias vzsh='vim ~/.config/zsh/.zshrc'
alias zsh='source ~/.config/zsh/.zshrc'
alias vzshp='vim ~/.config/zsh/.zsh_plugins.txt'
alias vzsha='vim ~/.config/zsh/.aliases.zsh'
alias vtheme='vim ~/.config/zsh/zsh_custom_themes/mytheme.zsh-theme'
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
alias cls='clear' 

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# git
alias add='git add'
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias bcheckout='git checkout -b'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push -u origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'
alias glog='git log --oneline --graph --decorate'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset %an -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias tmux='tmux -u'

# from aws
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

# for docker-compose
alias dc='docker-compose'

# for pipenv
alias ppi='pipenv install'
alias pps='pipenv shell'


# for mac
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#vlc
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}
