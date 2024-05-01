# Ansible Ubuntu Setup

## Prerequisites

* Ubuntu 22.04+ distro
* AMD64 architecture, Windows 11 host PC

## TODO

- Brew install packer


## Features

Edit the [variables](variables.yml) file to enable/disable features this playbook provides

Features:
* ✅ Zsh (required)
* ✅ Kubectl (includes k3s)
* ✅ Krew
* ✅ Apt-packages: yq, jq, python3, telnet, unzip, direnv, openssl, plocate and more 
* ✅ Docker
* ✅ Helm
* ✅ Terraform
* ✅ Golang
* ✅ Kubectx
* ✅ Kubens
* ✅ fzf
* ✅ Kubecolor
* ✅ git-delta

## Install

1. Clone the repo
1. cd to the root of the repo
1. Run `sudo apt update -y && sudo apt install dos2unix && find . -type f -exec dos2unix {} \; && bash bootstrap.sh`

### WSL

If using WSL, ensure you first copy the repo into the WSL distro:

```Powershell
Copy-Item -Path "C:\Users\user\Documents\repos\os-setup\linux" -Destination "\\wsl.localhost\Ubuntu-24.04\home\user" -Recurse -Force
```

## Linting

Run megalinter against this repo:
