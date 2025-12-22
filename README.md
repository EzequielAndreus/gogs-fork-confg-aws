# Ansible Automation Project

This repository contains **Ansible playbooks and roles** for automating the setup of various services, including **Docker**, **Gogs**, and **Splunk Forwarder**, on target hosts. The project uses a **modular role-based structure** for clarity and reusability.

---

## Project Structure

ansible/
├── dynamicInventory.sh # Script for dynamic inventory
├── inventory.ini # Static inventory file
├── roles/ # Ansible roles
│ ├── common/ # Common setup tasks (users, packages, etc.)
│ │ └── tasks/
│ │ └── main.yml
│ ├── docker/ # Install and configure Docker
│ │ └── tasks/
│ │ └── main.yml
│ ├── gogs/ # Setup Gogs (Git service)
│ │ ├── defaults/
│ │ │ └── main.yml
│ │ ├── tasks/
│ │ │ └── main.yml
│ │ └── templates/
│ │ └── docker-compose.yml.j2
│ └── splunk_forwarder/ # Setup Splunk Forwarder
│ ├── defaults/
│ │ └── main.yml
│ └── tasks/
│ └── main.yml
├── site.yml # Main playbook
└── README.md # This file

## Requirements

    • Ansible 2.9+ installed
    • Target hosts accessible via SSH
    • Docker installed on hosts (if required by roles)

## Usage

1. Clone the repository:
   git clone <https://github.com/EzequielAndreus/gogs-fork-confg-aws.git>
   cd ansible

2. Configure your inventory:
   • Use inventory.ini for static hosts, or
   • Use dynamicInventory.sh for dynamic host discovery

3. Run the main playbook:
   ansible-playbook -i inventory.ini site.yml

## Roles Overview

    • docker: Installs Docker and required dependencies.
    • gogs: Deploys Gogs using Docker Compose.
    • splunk_forwarder: Installs and configures Splunk Forwarder to forward logs to a Splunk indexer.

