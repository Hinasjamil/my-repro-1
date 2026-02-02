terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
   subscription_id = "bb46ce64-f409-4c00-8231-f5e3a23cae88"
 tenant_id = "7e368038-1167-4dbb-869b-098e9a100f09"
 client_id = "e6dc1c46-7c62-4c71-8419-1a5aeb993af9"
 client_secret = "tlx8Q~YfyRbTgTcYa8MsdIRRFTSD.uX6v0o8Sa4O"



   features {}
}
