locals {
  name = var.is_private ? "${var.name}-private-subnet" : "${var.name}-public-subnet"
  subnet_map = {
    for idx, prefix in var.address_prefixes :
    "${idx + 1}" => prefix
  }
}

resource "azurerm_subnet" "this" {
  for_each             = local.subnet_map
  name                 = "${local.name}-${each.key}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [each.value]
  service_endpoints    = var.service_endpoints
}
