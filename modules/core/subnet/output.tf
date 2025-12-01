
output "ids" {
  description = "List of subnet IDs"
  value       = [for k in sort(keys(azurerm_subnet.this)) : azurerm_subnet.this[k].id]
}

output "subnet_map" {
  value = azurerm_subnet.this
}