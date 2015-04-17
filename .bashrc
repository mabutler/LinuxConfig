# path
export PATH="/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/hsphere/shared/bin:/hsphere/shared/sbin"
 
# export PS1='\h:\w\$ '
PS1="\n[\h] \[\e[33;1m\]\u \[\e[32;1m\]\D{%H:%M} \[\e[0m\]\w \[\e[30;1m\]# \[\e[0m\]"
umask 022

alias src="source ~/dev/conf/bashrc"
alias ls="ls -alHh --color=auto"
alias g="git"
alias rmate="~/rmate"

alias php="/hsphere/shared/php55/bin/php-cli"

alias ldir="ls | egrep '^d'"
alias lfile="ls | egrep -v '^d'"

alias gs='g s' # gs is ghostscript, requires x display; g s is git status

source ~/.git-completion.bashrc

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g
