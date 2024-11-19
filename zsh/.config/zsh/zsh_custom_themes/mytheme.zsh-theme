# My custom theme for oh-my-zsh. Customised for seashell kitty theme.
# Author: Deepak Ramani

unset PROMPT RPROMPT

# https://www.ditig.com/256-colors-cheat-sheet
# local indianred=%F{131}
# local orangered1=%F{202}
# local palegreen3=%F{77}
# local darkgoldenrod=%F{136}
# local darkorange3=%F{166}
# local teal=%F{6}
# local green3=%F{40}
# local slateblue1=%F{99}
# local yellow1=%F{226}
# local red3=%F{160}
# local yellow_bold=%F{11} # yellow and green colors don't appear for seashell custom kitty theme.
# local green_bold=%F{10}

# Use this link to configure theme further - https://thevaluable.dev/zsh-install-configure-mouseless/



# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$green3%}✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$indianred%}✘"

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

#antidote is inconsitent with running git zfunctions. So custom function it is.
function git_prompt_status {
    # Get the status of the repository
    local git_status_output=$(git status --porcelain=v1 2>/dev/null)

    # Initialize an empty string to hold status symbols
    local status_symbols=""

    # Check for added files (staged)
    if [[ -n $(echo "$git_status_output" | grep "^A") ]]; then
        status_symbols+="$ZSH_THEME_GIT_PROMPT_ADDED"
    fi

    # Check for deleted files
    if [[ -n $(echo "$git_status_output" | grep "^.D") ]]; then
        status_symbols+="$ZSH_THEME_GIT_PROMPT_DELETED"
    fi

    # Check for modified files
    if [[ -n $(echo "$git_status_output" | grep "^.M") ]]; then
        status_symbols+="$ZSH_THEME_GIT_PROMPT_MODIFIED"
    fi

    # Check for renamed files
    if [[ -n $(echo "$git_status_output" | grep "^R") ]]; then
        status_symbols+="$ZSH_THEME_GIT_PROMPT_RENAMED"
    fi

    # Check for unmerged files
    if [[ -n $(echo "$git_status_output" | grep "^\(UU\|DD\|AU\|UA\|UD\|DU\)") ]]; then
        status_symbols+="$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi

    # Check for untracked files
    if [[ -n $(echo "$git_status_output" | grep "^\?\?") ]]; then
        status_symbols+="$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi

    # If repo has any changes (dirty) or untracked files
    if [[ -n "$status_symbols" ]]; then
        status_symbols="[$status_symbols%{$reset_color%}]"  # Enclose status symbols in square brackets
        echo "$status_symbols$ZSH_THEME_GIT_PROMPT_DIRTY"  # Append cross outside the brackets with space
    else
        echo "[$ZSH_THEME_GIT_PROMPT_CLEAN%{$reset_color%}]"  # Repo is clean
    fi
}


#function to get git branch name
function git_prompt_info {
    git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null
}


function get_git_prompt {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local git_status="$(git_prompt_status)" 
        if [[ -n $git_status ]]; then
            git_status="%{$reset_color%}$git_status%{$reset_color%}"
        fi
        
        local branch_name="$(git_prompt_info)" # Fetch branch name
        branch_name="%{$slateblue1%}$branch_name" # Add coloring
        local git_prompt="<${branch_name}$git_status>" # Include branch in the final prompt
        
        echo $git_prompt
    fi
}

#function to display git remote branch SHA. Tells also if a local branch is committed to remote.
function git_prompt_short_sha {
    # Check if the current directory is inside a Git repository
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        # Get the short SHA of the current HEAD
        local sha=$(git rev-parse --short HEAD 2>/dev/null)
        if [[ -z $sha ]]; then
            # No commits in the repository, display '[?]'
            echo "${ZSH_THEME_GIT_PROMPT_SHA_BEFORE}?${ZSH_THEME_GIT_PROMPT_SHA_AFTER}"
        else
            # Display the formatted short SHA
            echo "${ZSH_THEME_GIT_PROMPT_SHA_BEFORE}${sha}${ZSH_THEME_GIT_PROMPT_SHA_AFTER}"
        fi
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
