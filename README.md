# Terraformable Nginx

This repository allows you to spin up two servers on Linode and then uses an Ansible playbook to install Nginx on both servers. The Nginx servers will be configured to run `index.html`.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed
- [Linode](https://www.linode.com/) personal access token

## Steps to Use This Repository

1. **Clone the Repository**

    ```
    git clone https://github.com/airrloww/terraformable_Nginx.git
    cd terraformable_Nginx
    ```

2. **Add Linode Access Token to `main.tf`**

    Open `main.tf` and insert your Linode access token where indicated.

    (you may also want to change the root password)

3. **Initialize Terraform**

    ```
    terraform init
    ```

4. **Apply Terraform Configuration**

    ```
    terraform apply
    ```

5. **Run Ansible Playbook**

    ```
    ansible-playbook main.yml -u root -k --ask-become-pass
    ```

    Use the root password provided in `main.tf` when prompted.

And you're good to go! Your Nginx servers should now be up and running.


