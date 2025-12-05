variable "name" {
  type        = string
  description = "name"
}


variable "rg_name" {
  type        = string
  description = "resource group name"
}

variable "rg_location" {
  type        = string
  description = "region"
}

variable "sku_tier" {
  type        = string
  description = "stock keeping unit tier"
}

variable "sku_size" {
  type        = string
  description = "stock keeping unit size"
}

variable "app_settings" {
  type        = map(string)
  description = "java version"
  default = {
    "ENV"         = "dev"
    "ENABLE_LOGS" = "true"
  }
}

variable "always_on" {
  type        = bool
  description = "always_on cannot be set to true when using Free, F1, D1 Sku"
  default     = true
}

variable "application_stack" {
  description = "Application stack configuration"
  type = object({
    java_version        = optional(string)
    java_server         = optional(string)
    java_server_version = optional(string)
    node_version        = optional(string)
    python_version      = optional(string)
    dotnet_version      = optional(string)
    php_version         = optional(string)
    ruby_version        = optional(string)
    go_version          = optional(string)
    # docker_image = optional(string)
    # docker_tag   = optional(string)
  })
  default = {}
}