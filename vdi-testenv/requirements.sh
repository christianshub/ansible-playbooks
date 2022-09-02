#!/bin/sh

set -ex

# Install Python3, setup a virtual env
sudo dnf install -y python3-virtualenv gcc

python3 --version

if [ ! -d "env/" ]; then
    virtualenv env
fi

# Install pre-commit and ansible
./env/bin/python -m pip install --upgrade pip

./env/bin/pip install pre-commit
./env/bin/pre-commit --version
./env/bin/pre-commit install
./env/bin/pre-commit run --all-files

# Install Ansible (CentOS 8 Stream: Assuming epel is installed)
./env/bin/pip install ansible

ansible --version
