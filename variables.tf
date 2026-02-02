variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "rg-private-windows-project"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "server_subnet_prefix" {
  description = "Prefix for the Server Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "bastion_subnet_prefix" {
  description = "Prefix for the Azure Bastion Subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "vm_size" {
  description = "Size of the Windows VMs"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
  default     = "azureadmin"
}
