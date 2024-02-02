# variables

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "location."
  type        = string
}

variable "vnet_address_space" {
  description = "The name of the vnet address space."
  type        = list(string)
}

variable "secure_address" {
  description = "The name of the secure address space."
  type        = string
}