# Ansible Automation Project

This repository contains **Ansible playbooks and roles** for automating the setup of various services, including **Docker**, **Gogs**, and **Splunk Forwarder**, on target hosts. The project uses a **modular role-based structure** for clarity and reusability.

---

## Project Structure

<pre>
```
ansible/
├── dynamicInventory.sh
├── inventory.ini
├── roles/
│   ├── common/
│   │   └── tasks/
│   │       └── main.yml
│   ├── docker/
│   │   └── tasks/
│   │       └── main.yml
│   ├── gogs/
│   │   ├── defaults/
│   │   │   └── main.yml
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   └── templates/
│   │       └── docker-compose.yml.j2
│   └── splunk_forwarder/
│       ├── defaults/
│       │   └── main.yml
│       └── tasks/
│           └── main.yml
├── site.yml
└── README.md
```
</pre>


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

