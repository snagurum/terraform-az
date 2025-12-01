variable "name" {
  type        = string
  description = "name"
}

variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group name"
}

variable "vnet_name" {
  type        = string
  description = "vnet name"
}

variable "address_prefixes" {
  type        = list(string)
  description = "address_prefixes"
}

variable "service_endpoints" {
  type        = list(string)
  description = "service endpoints"
  default     = []
}

variable "is_private" {
  type        = bool
  description = "private subnet"
  default     = true
}

# variable "nsg_id" {
#     type = string
#     description = "nsg id"
#     default = null
# }

