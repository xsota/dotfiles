source ~/.export_path

autoload -U compinit
compinit

setopt auto_pushd prompt_subst
setopt pushd_ignore_dups

setopt correct
setopt auto_cd

#history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history

#ls
export LSCOLORS=cxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=2;30:ow=43;30'

alias ls="ls -GF"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

autoload -U compinit
compinit

#先方予測
#autoload predict-on
#predict-on

#prompt
PROMPT='${HOST}@%{[$[32+RANDOM%6]m%}%n%{[m%}%% '

RPROMPT='[%~]'

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi

        name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

if [[ -e "$gitdir/rprompt-nostatus" ]]; then
    echo "$name$action "
    return
    fi

        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
            color=%F{green}
            elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
            color=%F{yellow}
            elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=%B%F{red}
        else
                color=%F{red}
        fi

        echo "$color$name$action%f%b "
}

setopt prompt_subst

RPROMPT='[`rprompt-git-current-branch`%~]'
