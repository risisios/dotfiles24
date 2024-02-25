
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SBrowsing completions: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/risisios/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=${ZDOTDIR}/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt beep nomatch notify
unsetopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

# Tweaking the prompts
PROMPT="[%F{green}%~%f]$ "
RPROMPT="%? %T"

# Coloring the output of ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Loading the aliases
if [[ -f ${ZDOTDIR}/.zaliases ]]
then
	. ${ZDOTDIR}/.zaliases
fi

# Loading the environment variables
if [[ -f ${ZDOTDIR}/.zvariables ]]
then
	. ${ZDOTDIR}/.zvariables
fi
