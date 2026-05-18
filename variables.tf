variable "resource_group" {
  description = "Map of Resource Groups"
  type = map(object({
    name     = string
    location = string
  }))
}


variable "storage_accounts" {
  type = map(object({
    name                     = string
    rg_reference             = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "virtual_networks" {
  description = "Map of VNET configurations per environment"
  type = map(object({
    name             = string
    location         = string
    rg_reference     = string
    address_space    = list(string)
    app_public_cidr  = string
    app_private_cidr = string
    db_private_cidr  = string
    my_ip            = string
    nsg_name         = string
    nsg_rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    name              = string
    location          = string
    rg_reference      = string
    network_reference = string
    public_ip_name    = string
    admin_username    = string
    admin_password    = string
    vm_size           = optional(string, "Standard_B1s")
  }))
}