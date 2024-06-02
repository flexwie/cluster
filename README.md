# VPS Setup

This repo contains a collection of scripts and tools to setup Kubernetes on Hetzner infrastructure, join it to my tailnet and deploy ArgoCD to manage my applications.

## Setup

Run the setup tag of the ansible playbook, this will install the required packages from homebrew and configure your kubeconfig:

```sh
ansible-playbook playbook.yaml --tags "setup"
```

Then provision the infrastructure and run the rest of the playbook.

```sh
cd infrastructure
terraform init
terraform apply
cd ..
ansible-playbook playbook.yaml --tags "argo"
```
