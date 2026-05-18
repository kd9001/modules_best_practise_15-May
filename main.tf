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


module "network" {
  source   = "./modules/networking"
  for_each = var.virtual_networks

  vnet_name           = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_group[each.value.rg_reference].resource_group_name
  address_space       = each.value.address_space
  app_public_cidr     = each.value.app_public_cidr
  app_private_cidr    = each.value.app_private_cidr
  db_private_cidr     = each.value.db_private_cidr
  my_ip               = each.value.my_ip
  nsg_name            = each.value.nsg_name
  nsg_rules           = each.value.nsg_rules
}

module "vm" {
  source   = "./modules/compute"
  for_each = var.vms

  vm_name                     = each.value.name
  location                    = each.value.location
  resource_group_name         = module.resource_group[each.value.rg_reference].resource_group_name
  subnet_id                   = module.network[each.value.network_reference].app_public_subnet_id
  public_ip_name              = each.value.public_ip_name
  admin_username              = each.value.admin_username
  admin_password              = each.value.admin_password
  vm_size                     = each.value.vm_size
}