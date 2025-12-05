
resource "azurerm_subnet_network_security_group_association" "subnet_assoc" {
  for_each                  = var.subnet_map
  subnet_id                 = var.subnet_map[each.key].id
  network_security_group_id = var.nsg_id
}