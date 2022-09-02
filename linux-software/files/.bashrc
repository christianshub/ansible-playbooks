# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

# Run zsh
# if [ "$SHELL" != "/usr/bin/bash" ]
# then
#     export SHELL="/usr/bin/bash"
#     exec /usr/bin/bash
# fi

fetch() {
    git fetch
}

pull() {
    git pull origin main
}

push() {
    local message=""

    if [ -z "$1" ] # if first param is zero
    then
        message="WIP"
    else
        message=$1
    fi

    git add -A
    git commit -m "$message"
    git push --force
}

reset () {
    git reset $(git merge-base main $(git branch --show-current))
}


unset rc

export KUBE_EDITOR='code --wait'
export EDITOR='code --wait'
export VISUAL='code --wait'
export PS1="\W \$ "

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
