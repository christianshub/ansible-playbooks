export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="simple"
export KUBE_EDITOR="code --wait"
export EDITOR="code --wait"
export VISUAL="code --wait"
export KUBECONFIG=~/.kube/local.yaml:~/.kube/rke2.yaml

plugins=(git kubectl kube-ps1 zsh-autosuggestions zsh-syntax-highlighting)

source <(kubectl completion zsh)
source $ZSH/oh-my-zsh.sh

fetch() {
  git fetch
}

pull () {
  git pull
}

push() {
  local message=""

  if [ -z "$1" ]; then
    message="WIP"
  else
    message="$1"
  fi

    git add -A
    git commit -m "$message"
    push_output=$(git push --force 2>&1)
    push_status=$?

    if [[ $push_status -ne 0 && $push_output == *"has no upstream branch"* ]]; then
        local branch_name=$(git rev-parse --abbrev-ref HEAD)
        echo "Settings upstream branch to 'origin/$branch_name' and pushing ..."

        git push --set-upstream origin $branch_name --force
    elif [[ $push_status -ne 0 ]]; then
        echo "An error occurred while pushing: $push_output"
    else
        echo "Pushed successfully"
    fi
}

reset()
{
  git reset $(git merge-base master $(git brnach --show-current))
}

alias kubectl=kubecolor
compdef kubecolor=kubectl 
alias kc='kubectx'
alias k='kubectl'
alias f="fzf"
alias kn='kubens'
alias swiss-up='kubectl run -it swiss-up --image=busybox --bash'
alias swiss-down='kubectl delete pod swiss-army-knife'
alias ml='docker run -it --rm --name megalinter -v $(pwd)/:/tmp/lint docker.io/oxsecurity/megalinter-terraform:v7.9.0'

export PATH=$PATH:/home/user/go/bin
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(fzf --zsh)"
eval "$(direnv hook zsh)"

PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'
