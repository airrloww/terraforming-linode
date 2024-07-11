This repository allows you to spin up two servers on Linode and then uses an Ansible playbook to install Nginx on both servers. The Nginx servers will be configured to run `index.html`.

## Prerequisites
- [Linode](https://www.linode.com/) personal access token

## Steps to Use This Repository

1. **Clone this Repository**
2. **Add Linode Access Token to `main.tf`**
4. **Run Terraform**
    ```
    terraform init
    terraform apply
    ```
6. **Run Ansible Playbook**
    ```
    ansible-playbook main.yml -u root -k --ask-become-pass
    ```
    Use the root password provided in `main.tf` when prompted.

And you're good to go!
