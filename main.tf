module "resource_group" {
  source = "./modules/resource-group"

  for_each = var.resource_group

  resource_group_name = each.value.name
  location            = each.value.location
}

module "storage_account" {
  source = "./modules/storage-account"

  for_each = var.storage_accounts

  storage_account_name = each.value.name
  location             = each.value.location
  resource_group_name  = module.resource_group[each.value.rg_reference].resource_group_name

  account_replication_type = each.value.account_replication_type
  account_tier             = each.value.account_tier
}


module "vnet" {
  source = "./modules/virtual-network"

  for_each = var.virtual_network

  vnet_name           = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_group[each.value.rg_reference].resource_group_name
  address_space       = each.value.address_space

}