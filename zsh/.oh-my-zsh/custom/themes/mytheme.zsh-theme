# My custom theme for oh-my-zsh. Customised for seashell kitty theme.
# Author: Deepak Ramani

unset PROMPT RPROMPT
# https://www.ditig.com/256-colors-cheat-sheet
local indianred=%F{131}
local orangered1=%F{202}
local palegreen3=%F{77}
local darkgoldenrod=%F{136}
local darkorange3=%F{166}
local teal=%F{6}
local green3=%F{40}
local slateblue1=%F{99}
local yellow1=%F{226}
# local yellow_bold=%F{11} # yellow and green colors don't appear for seashell custom kitty theme.
# local green_bold=%F{10}

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$green3%} ✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$indianred%} ✘"

# Git status.
ZSH_THEME_GIT_PROMPT_ADDED="%{$green3%}+"
ZSH_THEME_GIT_PROMPT_DELETED="%{$indianred%}-"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$palegreen3%}*"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$darkgoldenrod%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$darkorange3%}="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$teal%}?"

# Git sha.
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="[%{$darkorange3%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}]"

#function to get git branch name
function git_prompt_info {
    git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null
}

function get_git_prompt {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local git_status="$(git_prompt_status)" 
        if [[ -n $git_status ]]; then
            git_status="[$git_status%{$reset_color%}]"
        fi
        
        local branch_name="$(git_prompt_info)" # Fetch branch name
        branch_name="%{$slateblue1%}$branch_name" # Add coloring
        local git_prompt="<${branch_name}$git_status>" # Include branch in the final prompt
        
        echo $git_prompt
    fi
}


function tf_prompt_info() {
  # dont show 'default' workspace in home dir
  [[ "$PWD" != ~ ]] || return
  # check if in terraform dir and file exists
  [[ -d .terraform && -r .terraform/environment ]] || return
}

PROMPT+='%{$fg[yellow]%}[%*]'
PROMPT+='%F{148}[%1~]%{$reset_color%}' #the number before tilde denotes how many directory levels. 1 means current dir.
PROMPT+=' %(?:%{$yellow1%}➜ :%{$orangered1%}➜ )'
RPROMPT+='%{$reset_color%}$(get_git_prompt)'
RPROMPT+=' $(git_prompt_short_sha)'
RPROMPT+=' $(tf_prompt_info)'

setopt prompt_subst

# Machine name.

#     if [ -f ~/.box-name ]; then
#         cat ~/.box-name
#     else
#         echo $HOST
#     fi
# }

# User name.
# function get_usr_name {
#     local name="%n"
#     if [[ "$USER" == 'root' ]]; then
#         name="%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
#     fi
#     echo $name
# }


# %{$blue%}@\
# %{$cyan_bold%}$(get_box_name): \
# %{$green_bold%}$(get_usr_name)\

# Check out this [link](https://gist.github.com/zulhfreelancer/9c410cad5efa9c5f7c74cd0849765865) and
# [this] (https://bneijt.nl/blog/add-a-timestamp-to-your-bash-prompt/) for more options.
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# from here -- https://gist.github.com/doubleknd26/c4fcd2e65c3397947248878065b644ed
# function parse_git_branch() {
#     git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
# }
# setopt PROMPT_SUBST
# PROMPT+='%{$fg[yellow]%}[%*]'
# PROMPT+=' %F{148}[%3~]%{$reset_color%}'
# PROMPT+='%F{39}$(get_git_prompt)%{$reset_color%}'
# PROMPT+=' %F{219}%(?:%{%}➜ :%{%}➜ )'
# PROMPT+=' %F{148}%3~%{$reset_color%} $(git_prompt_info) '
# PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#
# %(?:%{%}➜ :%{%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)
# RPROMPT='%{$fg[yellow]%}[%*] ' # displays time(24h format) on the right side(RPROMPT).
# RPROMPT='[%D{%H:%M:%S}] ' # Dispalys Date in the 24h format.
# PROMPT='%{$fg[yellow]%}[%*] ${COLOR_DIR}[%c] %{$reset_color%}$(git_prompt_info) %(?:%{%}➜ :%{%}➜ )'$PROMPT # Displays time in 24h on the left side. Refer
# [this](https://stackoverflow.com/a/69164331). fg stands for foreground colour.
# PROMPT='%2~ %# '


# From https://salferrarello.com/zsh-git-status-prompt/
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
# autoload -Uz add-zsh-hook vcs_info
# # Enable substitution in the prompt.
# setopt prompt_subst
# # Run vcs_info just before a prompt is displayed (precmd)
# add-zsh-hook precmd vcs_info
# # add ${vcs_info_msg_0} to the prompt
# # e.g. here we add the Git information in red 
# PROMPT+='%{$fg[yellow]%}[%*]'
# PROMPT+=' %F{148}[%~]'
# PROMPT+=' %F{39}${vcs_info_msg_0_}%f'
# PROMPT+=' %F{219}%(?:%{%}➜ :%{%}➜ )'
#
# # Enable checking for (un)staged changes, enabling use of %u and %c
# zstyle ':vcs_info:*' check-for-changes true
# # Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
# zstyle ':vcs_info:*' unstagedstr ' *'
# zstyle ':vcs_info:*' stagedstr ' +'
# # Set the format of the Git information for vcs_info
# zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
# zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
