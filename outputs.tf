output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "bastion_host_name" {
  value = module.bastion.bastion_host_name
}

output "vm_app_name" {
  value = module.compute.vm_app_name
}

output "vm_app_private_ip" {
  value = module.compute.vm_app_private_ip
}

output "vm_db_name" {
  value = module.compute.vm_db_name
}

output "vm_db_private_ip" {
  value = module.compute.vm_db_private_ip
}

output "key_vault_name" {
  value = module.security.key_vault_name
}

output "admin_username" {
  value = var.admin_username
}

output "instruction_to_get_password" {
  value = "Run 'az keyvault secret show --vault-name ${module.security.key_vault_name} --name vm-admin-password --query value -o tsv' to retrieve the password."
}
