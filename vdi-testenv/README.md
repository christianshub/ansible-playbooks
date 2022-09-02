# vdi-testenv

Sets up a VDI test environment through vagrant and ansible (host: CentOS Stream 8)

## How-to

1) Run the `requirements.sh` file to install

- pre-commit
- python3
- ansible

2) Run `env/bin/ansible-playbook site.yaml --ask-become-pass`

## TODO:

- [ ] Implement a pipeline: https://medium.com/devops-dudes/scaling-devops-with-ansible-part-2-test-test-test-1fe93f1123ad
- [ ] Look at Ansible lint and Yaml lint: https://github.com/diodonfrost/ansible-role-vagrant

## Refs

- Vagrant: https://github.com/diodonfrost/ansible-role-vagrant/search?q=sort_versions
