resource_group = {
  rg1 = {
    name     = "rg-platform-dev-eastus-001"
    location = "East US"
  }

  rg2 = {
    name     = "rg-platform-dev-eastus-002"
    location = "East US"
  }
}


storage_accounts = {
  st1 = {
    name                     = "stplatformdeveus001"
    rg_reference             = "rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  st2 = {
    name                     = "stplatformdeveus002"
    rg_reference             = "rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  st3 = {
    name                     = "stplatformdeveus003"
    rg_reference             = "rg2"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}


## why we used resource_group_key not resource?
# Because module outputs are tracked by:for_each keys NOT by Azure names.


virtual_network = {
  dev = {
    name             = "vnet-3tier-dev"
    location         = "East US"
    rg_reference     = "rg1"
    address_space    = ["10.0.0.0/16"]
    app_public_cidr  = "10.0.1.0/24"
    app_private_cidr = "10.0.2.0/24"
    db_private_cidr  = "10.0.3.0/24"
    my_ip            = "YOUR.IP.HERE/32"
  }
}