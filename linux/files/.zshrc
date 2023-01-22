# Path to your oh-my-zsh configuration.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="robbyrussell"
export ZSH_THEME="simple"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-autosuggestions z zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-z/zsh-z.plugin.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
