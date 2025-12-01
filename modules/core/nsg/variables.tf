variable "name" {
  type        = string
  description = "name of project"
}

variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable "location" {
  type        = string
  description = "region"
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    destination_address_prefix = string
    source_address_prefix      = string

  }))
  default = [{
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }]
}