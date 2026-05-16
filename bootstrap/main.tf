resource "azurerm_resource_group" "tfstate_rg" {
  name     = "rg-tfstate-dev-eastus-001"
  location = "East US"
}

resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "sttfstatedeveus001"
  location                 = azurerm_resource_group.tfstate_rg.location
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
}

resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.tfstate_sa.id
  container_access_type = "private"
}