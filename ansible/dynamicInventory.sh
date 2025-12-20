#!/bin/bash

# Go to the Terraform folder
cd infra || exit 1

if ! terraform init -reconfigure -backend=true; then
  echo "Terraform initialization failed. Aborting." >&2
  exit 1
fi

# Get EC2 public IP from Terraform
EC2_IP=$(terraform output -raw ec2_public_ip)

# Validate IP
if [[ -z "$EC2_IP" ]]; then
  echo "Could not obtain the public IP address of the EC2"
  exit 1
fi

# Return to project root
cd ..

# Generate the Ansible inventory
cat <<EOF >ansible/inventory.ini
[gogs_server]
gogs ansible_host=$EC2_IP ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/gogs_key.pem
EOF

echo "inventory.ini file generated with IP: $EC2_IP"
