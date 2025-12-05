
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "name" {
  type        = string
  description = "name of project"
}

variable "location" {
  type        = string
  description = "region"
}

variable "address_space" {
  type        = list(string)
  description = "list of cidr block"
}

variable "public_address_space" {
  type        = list(string)
  description = "list of public cidr block"
}

variable "private_address_space" {
  type        = list(string)
  description = "list of private cidr block"
}

variable "public_ingress_rules" {
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
  default     = []
  description = "list of public subnet's ingress rules"
}

variable "private_ingress_rules" {
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
  description = "list of private subnet's ingress rules"
}



