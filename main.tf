resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source                = "./modules/networking"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  vnet_address_space    = var.vnet_address_space
  server_subnet_prefix  = var.server_subnet_prefix
  bastion_subnet_prefix = var.bastion_subnet_prefix
}
module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

data "azurerm_client_config" "current" {}

module "security" {
  source              = "./modules/security"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

module "compute" {
  source               = "./modules/compute"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  subnet_id            = module.networking.server_subnet_id
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = module.security.vm_admin_password
  boot_diagnostics_uri = module.monitoring.storage_account_blob_endpoint
}

module "bastion" {
  source              = "./modules/bastion"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = module.networking.bastion_subnet_id
}

