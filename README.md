## Cloud-1
  Cloud-1 is a DevOps automation project for the 42 Cursus that focuses on deploying a fully containerized WordPress environment with infrastructure-as-code and configuration management. This setup includes automatic provisioning of a cloud instance, secure service configuration, and container orchestration using Docker and Ansible.

# 🚀 Overview
  
  This project automates the deployment of a WordPress site with the following stack:
  
  WordPress
  
  MariaDB
  
  phpMyAdmin
  
  Nginx
  
  Docker & Docker Compose
  
  Ansible
  
  Terraform
  
  The entire process is automated: from creating a server on DigitalOcean using Terraform, to configuring and deploying containers using Ansible.

# ✅ Project Goals
  Fully automated WordPress deployment
  
  Persistent data and automatic restart on reboot
  
  Secure architecture (no public access to the database)
  
  Modular containerized services (1 process per container)
  
  Infrastructure provisioning with Terraform
  
  Parallel deployment on multiple servers
  
  Only requirement: Ubuntu 20.04 LTS instance with SSH and Python

# Full Automation 
  You can use the provided script to automate the full pipeline:
  
  ``` ./script.sh ```

# 🔐 Security
  The database is not accessible from the internet
  Services run in isolated containers
  SSH is the only public-facing port

# 🐳 Docker Services
  Each service runs in its own container:
  
  wordpress: PHP-FPM-based WordPress site
  
  mariadb: MySQL-compatible database
  
  nginx: Reverse proxy and static file server
  
  phpmyadmin: Web interface for managing the database
  
  Docker Compose ensures proper startup order and dependency management.

# 🧹 Uninstall
  To remove the deployment:
  ``` cd ansible

    ansible-playbook -i inventory.ini uninstallPlaybook.yaml

    terraform destroy
```


