# 1. Public subnet — Nginx VM goes here for learning (saves NAT Gateway cost)

resource "azurerm_subnet" "app_public" {
  name                 = "${var.vnet_name}-app-public"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.app_public_cidr]
}

# 2. App private — reserved for future app tier (empty for now)

resource "azurerm_subnet" "app_private" {
  name                 = "${var.vnet_name}-app-private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.app_private_cidr]
}

# 3. DB private — PostgreSQL goes here
# ⚠️ DELEGATION REQUIRED for Azure PostgreSQL Flexible Server

resource "azurerm_subnet" "db_private" {
  name                 = "${var.vnet_name}-db-private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.db_private_cidr]


  delegation {
    name = "postgresql"
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}