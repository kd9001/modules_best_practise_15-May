output "app_public_subnet_id" {
  description = "Subnet ID for the public/app tier"
  value       = azurerm_subnet.app_public.id
}

output "app_private_subnet_id" {
  description = "Subnet ID for the private app tier"
  value       = azurerm_subnet.app_private.id
}

output "db_private_subnet_id" {
  description = "Subnet ID for the private DB tier"
  value       = azurerm_subnet.db_private.id
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

