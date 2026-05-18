variable "vm_name" {
  description = "Name of the virtual machine"
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

variable "subnet_id" {
  description = "Subnet ID where VM will be attached"
  type        = string
}

variable "public_ip_name" {
  description = "Name for the public IP address"
  type        = string
}

variable "public_ip_allocation_method" {
  description = "Static or Dynamic"
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "Basic or Standard"
  type        = string
  default     = "Standard"
}

variable "nic_ip_config_name" {
  description = "Name of the NIC IP configuration"
  type        = string
  default     = "internal"
}

variable "private_ip_allocation" {
  description = "Dynamic or Static"
  type        = string
  default     = "Dynamic"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "disable_password_auth" {
  description = "Set to true to disable password and use SSH key only"
  type        = bool
  default     = false
}

variable "os_disk_caching" {
  description = "OS disk caching type"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_type" {
  description = "OS disk storage account type"
  type        = string
  default     = "Standard_LRS"
}

variable "image_publisher" {
  description = "OS image publisher"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "OS image offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "OS image SKU"
  type        = string
  default     = "22_04-lts"
}

variable "image_version" {
  description = "OS image version"
  type        = string
  default     = "latest"
}