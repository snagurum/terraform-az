output "vnet_name" {
  value = module.vnet.name
}
output "vnet_id" {
  value = module.vnet.id
}

output "public_subnet" {
  value = module.public_subnet.ids
}


output "private_subnet" {
  value = module.private_subnet.ids
}
