#!/bin/bash

set -e 
set -o pipefail

cd terraform

echo "Planning infrastructure..."
terraform plan

echo "Applying infrastructure..."
terraform apply -auto-approve

echo "Getting Droplet IPs from Terraform..."
IPS=$(terraform output -json droplet_ip_address | jq -r '.[]')

cd ..

if [ -z "$IPS" ]; then
    echo " No IPs found "
    exit 1
fi

echo "Waiting for Droplets to be ready for SSH..."

for ip in $IPS; do
  echo "Waiting for $ip..."
  while ! nc -z $ip 22; do
    sleep 5
  done
  echo "$ip is reachable on port 22"
done

echo "Generating Ansible inventory..."

INVENTORY_FILE="./ansible/inventory.ini"
echo "[webservers]" > $INVENTORY_FILE
for ip in $IPS; do
    echo "$ip ansible_user=root hostname=$ip ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> $INVENTORY_FILE
done
echo "Inventory generated:"
cat $INVENTORY_FILE

echo "Running Ansible playbook..."
ansible-playbook -i $INVENTORY_FILE ./ansible/Playbook.yaml --vault-password-file=./ansible/vars/vault_pass.txt
