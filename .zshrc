
autoload -U compinit
compinit

setopt auto_pushd prompt_subst
setopt pushd_ignore_dups

setopt correct
setopt auto_cd


HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history

PROMPT='${HOST}@%{[$[32+RANDOM%6]m%}%n%{[m%}%b%% '
SPROMPT="$fg[red]%}%{$suggest%} %B%r%b %{$fg[red]%}? 
[(n)o, (y)es, (a)bort, (e)dit]:${reset_color}"
RPROMPT='[%~]'
