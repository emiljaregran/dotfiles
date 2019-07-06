# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Activate vi mode with <Escape>
set -o vi

# Adding colors
alias ls='ls -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'

alias weather='wego'
alias sysinfo='neofetch | lolcat'

parse_git_branch()
{
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
