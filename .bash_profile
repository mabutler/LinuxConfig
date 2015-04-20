reload=0
if [ -d .git ]; then
	git fetch --quiet
	git update-index -q --ignore-submodules --refresh
	err=0

	if ! git diff-files --quiet --ignore-submodules --
	then
		err=1
	fi

	if ! git diff-index --cached --quiet HEAD --ignore-submodules --
	then
		err=1
	fi

	LOCAL=$(git rev-parse @{0})
	REMOTE=$(git rev-parse @{u})
	BASE=$(git merge-base @{0} @{u})

	if [ $LOCAL != $REMOTE ] && [ $LOCAL = $BASE ] && [ $err = 0 ]
	then
		git pull --quiet --ff-only
		reload=1
	fi
fi

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

if hash tmux 2>/dev/null; then
	if [[ -z "$TMUX" ]]; then
		if [[ $(tmux info) == *dev02Session* ]]; then
			tmux attach -t dev02Session;
		else
			exec tmux \
			new -s dev02Session 'clear && tail -F /hsphere/local/var/httpd/logs/php_error.log'\; \
			split-window -v -p 80 -t 0 'unset TMUX; tmux'\; \
			set status off \;
		fi
	fi
fi

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

if [ $reload = 1 ]
then
	source ~/.bash_profile
fi
