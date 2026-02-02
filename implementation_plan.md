# Implementation Plan: 2 Private Windows Servers on Azure

## Objective
Deploy two private Windows Servers communicating only via private IP, accessible via Azure Bastion, conforming to security best practices.

## Architecture
- **Resource Group**: Container for all resources.
- **Networking**:
  - **VNet**: `10.0.0.0/16`
  - **Subnets**:
    - `snet-servers`: `10.0.1.0/24` (Hosts the 2 Windows VMs)
    - `AzureBastionSubnet`: `10.0.2.0/24` (Dedicated for Azure Bastion)
- **Security**:
  - **NSGs**:
    - `nsg-servers`: Restricted rules (Deny Internet Inbound, Allow RDP from Bastion only).
  - **Key Vault**: Securely generate and store VM Admin Passwords.
- **Compute**:
  - **VM1 (App/Mgmt)**: Windows Server 2022, Private IP.
  - **VM2 (DB/File)**: Windows Server 2022, Private IP.
- **Access**:
  - **Azure Bastion**: Managed Jumpbox service for secure HTML5-based RDP access.
- **Monitoring & Storage**:
  - **Storage Account**: Boot diagnostics.
  - **Log Analytics**: Centralized logging.

## Current Status
- [x] Create Resource Group
- [x] Configure Networking (VNet, Subnets, NSG for servers)
- [x] Setup Key Vault & Secrets
- [x] Deploy Windows VMs (App & DB)
- [x] Configure Boot Diagnostics & Monitoring
- [x] Deploy Azure Bastion
- [x] Refactor into Terraform Modules

## Terraform Structure (Modular)
- **Root Directory**:
  - `providers.tf`, `variables.tf`, `outputs.tf`: Global configs.
  - `main.tf`: Calls modules.
- **Modules**:
  - `modules/networking`: VNet, Subnets, NSG.
  - `modules/compute`: VMs, NICs, Boot Diagnostics.
  - `modules/security`: Key Vault, Secrets.
  - `modules/bastion`: Public IP, Bastion Host.
  - `modules/monitoring`: Storage Account, Log Analytics.
