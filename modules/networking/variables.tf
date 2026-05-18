variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "CIDR block for the VNET"
  type        = list(string)
}

variable "app_public_cidr" {
  description = "CIDR for public/app subnet"
  type        = string
}

variable "app_private_cidr" {
  description = "CIDR for private app subnet"
  type        = string
}

variable "db_private_cidr" {
  description = "CIDR for private DB subnet"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for SSH access. Get it from https://ifconfig.me"
  type        = string
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "nsg_rules" {
  description = "Map of NSG rules. Use direction = Inbound for ingress, Outbound for egress"
  type = map(object({
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
}