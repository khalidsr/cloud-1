## Cloud-1
Cloud-1 is a DevOps automation project for the 42 Cursus that focuses on deploying a fully containerized WordPress environment with infrastructure-as-code and configuration management. 
This setup includes automatic provisioning of a cloud instance, secure service configuration, and container orchestration using Docker,Docker compose, Ansible and terraform .
🚀 Overview
    This project automates the deployment of a WordPress site with the following stack:
  
  - WordPress
    
   - MariaDB
    
  - phpMyAdmin
    
  - Nginx
    
  -  Docker & Docker Compose
    
  - Ansible
    
  - Terraform
    
  -  The entire process is automated: from creating a server on DigitalOcean using Terraform, to configuring and deploying containers using Ansible.
    

1. Prerequisites
  - Terraform installed
    
  -  Ansible installed
    
  - DigitalOcean API token
    
  -  SSH key added to your DigitalOcean account

2. Infrastructure Deployment
    Provision the server with Terraform:
    
    ```
    cd terraform
    terraform init
    terraform apply
    ```
    This will create a droplet on DigitalOcean and output its IP address.

3. Server Configuration
    Configure the instance with Ansible:
    
    ```
    cd ansible
    ansible-playbook -i inventory.ini Playbook.yaml
    ```
    This installs Docker, configures security settings, and deploys the containerized services.

4. Full Automation (Optional)
    You can use the provided script to automate the full pipeline:

    ```
    ./script.sh
    ```
🔐 Security
  -  The database is not accessible from the internet
    
  - Services run in isolated containers
    
  - SSH is the only public-facing port

🐳 Docker Services
    Each service runs in its own container:
    
   - wordpress: PHP-FPM-based WordPress site
    
   - mariadb: MySQL-compatible database
    
   - nginx: Reverse proxy and static file server
    
   - phpmyadmin: Web interface for managing the database
    
   - Docker Compose ensures proper startup order and dependency management.
    
   - Secrets and sensitive data should be securely managed in ansible/vars/secrets.yml.
