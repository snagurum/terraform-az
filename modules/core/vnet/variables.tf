variable "name" {
  type        = string
  description = "name of vnet"
}

variable "location" {
  type        = string
  description = "Azure Location"
}

variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group name"
}

variable "address_space" {
  type        = list(string)
  description = "address space"
}

