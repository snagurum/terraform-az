
variable "nsg_id" {
  type        = string
  description = "network security group"
}

variable "subnet_map" {
  type = map(any)
}

