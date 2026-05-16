terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-dev-eastus-001"
    storage_account_name = "sttfstatedeveus001"
    container_name       = "tfstate"
    key                  = "bootstrap.tfstate"
  }
}