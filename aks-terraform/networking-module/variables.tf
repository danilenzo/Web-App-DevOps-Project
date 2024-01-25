variable "resource_group_name" {
  description = "The name of the Azure Resource Group where networking resources will be deployed."
  type        = string
  default     = "default-resource-group"
}

variable "location" {
  description = "The Azure region where the networking resources will be deployed."
  type        = string
  default     = "United Kingdom"
}

variable "vnet_address_space" {
  description = "The address space for the Azure Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
