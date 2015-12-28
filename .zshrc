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

#prompt
PROMPT='${HOST}@%{[$[32+RANDOM%6]m%}%n%{[m%}%b%% '
SPROMPT="$fg[red]%}%{$suggest%} %B%r%b %{$fg[red]%}? 
[(n)o, (y)es, (a)bort, (e)dit]:${reset_color}"
RPROMPT='[%~]'

#ls
export LSCOLORS=cxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=2;30:ow=43;30'

alias ls="ls -GF"
