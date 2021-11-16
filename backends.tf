terraform {
  backend "azurerm" {
    storage_account_name = "tf429tfstate001"
    resource_group_name  = "tf429-tfstate-rg"
    container_name       = "tf429-terraform-state"
    key                  = "legacy.tfstate"
  }
}

provider "azurerm" {
  features {}
}