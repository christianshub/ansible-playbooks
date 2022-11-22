#!/bin/sh

echo "Global: Installing dependencies..."

if cat /etc/os-release | grep -q CentOS; then
    sudo dnf -y update
    sudo dnf -y install epel-release git python3-virtualenv gcc
    echo "OS: CentOS"
elif cat /etc/os-release | grep -q Hat; then
    sudo dnf -y update
    subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms
    sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
    sudo dnf -y install git python3-virtualenv gcc
    echo "OS: RHEL"
elif cat /etc/os-release | grep -q Ubuntu; then
    echo "OS: Ubuntu"
    sudo apt-get -y install python3-virtualenv
fi

if [ ! -d "env/" ]; then
    virtualenv env
fi

echo "Virtualenv: Installing ansible and pre-commit..."
./env/bin/pip install ansible
./env/bin/pip install pre-commit
./env/bin/pre-commit --version
./env/bin/pre-commit install
./env/bin/pre-commit run --all-files
