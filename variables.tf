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

variable "virtual_network" {
  type = map(object({
    name             = string
    location         = string
    rg_reference     = string
    address_space    = list(string)
    app_private_cidr = string
    app_public_cidr  = string
    db_private_cidr  = string
    my_ip            = string
  }))
}

