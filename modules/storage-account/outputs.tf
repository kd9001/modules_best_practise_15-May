output "storage_account_name" {
  description = "Storage account name"
  value       = azurerm_storage_account.this.name
}

output "storage_account_id" {
  description = "Resource Group ID"
  value       = azurerm_storage_account.this.id
}