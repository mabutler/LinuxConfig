
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

EDITOR=nano

export EDITOR

bind -f ~/.inputrc

#if [[ -z "$TMUX" ]]; then
#	if [[ $(tmux info) == *dev02Session* ]]; then
#		tmux attach -t dev02Session;
#	else
#		exec tmux \
#		new -s dev02Session 'clear && tail -F /hsphere/local/var/httpd/logs/php_error.log'\; \
#		split-window -v -p 80 -t 0 'unset TMUX; tmux'\; \
#		set status off \;
#	fi
#fi

# get() { printf "\033]0;__pw:"`pwd`"\007" ; 
# for file in $* ; do printf "\033]0;__rv:"${file}"\007" ; done ; 
# printf "\033]0;__ti\007" ; }

winscp() { echo -ne "\033];__ws:${PWD}\007"; }

sublime () {
	for file in "$@"
	do
		~/rmate "$file"
	done

	return 0
}
